use actix_web::{get, post, web, HttpResponse, Responder};
use serde::{Deserialize, Serialize};
use serde_json::json;
use reqwest::Client;
use utoipa::{ToSchema}; 
use sqlx::{PgPool, FromRow}; 

#[derive(Debug, Deserialize, ToSchema)]
pub struct NavigationRequest {
    start: Coordinate,
    end: Coordinate,  // 휠체어 버전 추가
}

#[derive(Debug, Deserialize, Serialize, FromRow, ToSchema)]
pub struct Coordinate {
    latitude: f64,
    longitude: f64,
}

#[derive(Debug, Deserialize, Serialize, ToSchema)]
#[serde(rename_all = "snake_case")]
pub enum WheelchairVersion {
    StandardWheelchair,
    BasicPowerWheelchair,
    AdvancedPowerWheelchair,
}

#[derive(Debug, Serialize, ToSchema)]
pub struct NavigationResponse {
    duration: String,
    distance: String,
    route: Vec<Coordinate>,
    warnings: Vec<String>,
}


#[utoipa::path(
    get,
    path = "/api/navigation/node_coordinates/{node_id}",
    params(
        ("node_id" = String, Path, description = "Building ID to retrieve details")
    ),
    responses(
        (status = 200, description = "Coordinates retrieved successfully", body = Coordinate),
        (status = 404, description = "Node not found"),
        (status = 500, description = "Database error")
    ),
    tag = "Navigation API"
)]
#[get("/api/navigation/node_coordinates/{node_id}")]
async fn get_node_coordinates(
    pool: web::Data<PgPool>,
    node_id: web::Path<String>,
) -> impl Responder {
    let node_id = node_id.into_inner();

    let query = r#"
        SELECT 
            ST_Y(ST_Transform(way, 4326)) AS latitude,
            ST_X(ST_Transform(way, 4326)) AS longitude
        FROM planet_osm_point
        WHERE osm_id = $1::bigint
    "#;

    // ✅ 데이터베이스 쿼리 실행
    match sqlx::query_as::<_, Coordinate>(query)
        .bind(node_id)
        .fetch_optional(pool.get_ref())
        .await
    {
        Ok(Some(coordinate)) => HttpResponse::Ok().json(coordinate),
        Ok(None) => HttpResponse::NotFound().json(json!({
            "error": "No matching node_id found."
        })),
        Err(e) => HttpResponse::InternalServerError().json(json!({
            "error": format!("Database error: {:?}", e)
        })),
    }
}

#[utoipa::path(
    get,
    path = "/api/navigation/node_coordinates/{node_id}",
    params(
        ("node_id" = String, Path, description = "Building ID to retrieve details")
    ),
    responses(
        (status = 200, description = "Coordinates retrieved successfully", body = Coordinate),
        (status = 404, description = "Node not found"),
        (status = 500, description = "Database error")
    ),
    tag = "Navigation API"
)]
#[get("/api/navigation/polygon_center/{node_id}")]
async fn get_polygon_center(
    pool: web::Data<PgPool>,
    node_id: web::Path<String>,
) -> impl Responder {
    let node_id = node_id.into_inner();

    let query = r#"
        SELECT 
            ST_Y(ST_Centroid(ST_Transform(way, 4326))) AS latitude,
            ST_X(ST_Centroid(ST_Transform(way, 4326))) AS longitude
        FROM planet_osm_polygon
        WHERE osm_id = $1::bigint
    "#;

    // ✅ 데이터베이스 쿼리 실행
    match sqlx::query_as::<_, Coordinate>(query)
        .bind(node_id)
        .fetch_optional(pool.get_ref())
        .await
    {
        Ok(Some(coordinate)) => HttpResponse::Ok().json(coordinate),
        Ok(None) => HttpResponse::NotFound().json(json!({
            "error": "No matching node_id found."
        })),
        Err(e) => HttpResponse::InternalServerError().json(json!({
            "error": format!("Database error: {:?}", e)
        })),
    }
}

#[utoipa::path(
    post,
    path = "/api/navigation/route",
    request_body = NavigationRequest,
    responses(
        (status = 200, description = "Route calculated successfully", body = NavigationResponse),
        (status = 400, description = "Invalid slope range"),
        (status = 404, description = "No valid route found for the given constraints"),
        (status = 500, description = "Failed to calculate route")
    ),
    tag = "Navigation API"
)]
#[post("/api/navigation/route")]
async fn calculate_route(
    body: web::Json<NavigationRequest>,
) -> impl Responder {
    let request = body.into_inner();
    let valhalla_url = "http://localhost:8002/route";

    // ✅ 휠체어 코스팅 고정 옵션
    let costing = "bicycle";
    let costing_options = json!({
        "bicycle": {
            "bicycle_type": "road",
            "cycling_speed": 5.0,
            "use_roads": 1.0,
            "use_hills": 0.0,
            "avoid_bad_surfaces": true,
            "max_slope": 5.0,
            "wheelchair_accessible": true,
            "country_crossing_penalty": 1000.0,
            "service_penalty": 10.0,
            "maneuver_penalty": 5.0,
            "alley_penalty": 20.0,
            "gate_penalty": 1000.0,
            "ferry_penalty": 5000.0,
            "walkway_factor": 1.0,
            "sidewalk_factor": 1.0,
            "search_radius": 100.0
        }
    });

    // ✅ Valhalla 요청 데이터 구성
    let valhalla_request = json!({
        "locations": [
            { "lat": request.start.latitude, "lon": request.start.longitude },
            { "lat": request.end.latitude, "lon": request.end.longitude }
        ],
        "costing": costing,
        "costing_options": costing_options,
        "shape_format": "polyline5",
        "directions_options": { "units": "km" }
    });

    let client = Client::new();
    let valhalla_response = client.post(valhalla_url)
        .json(&valhalla_request)
        .send()
        .await;

    match valhalla_response {
        Ok(response) if response.status().is_success() => {
            let valhalla_data: serde_json::Value = response.json().await.unwrap();
            let duration = valhalla_data["trip"]["summary"]["time"].as_f64().unwrap_or(0.0) as u32;
            let distance = valhalla_data["trip"]["summary"]["length"].as_f64().unwrap_or(0.0);

            let route = valhalla_data["trip"]["legs"][0]["shape"]
                .as_str()
                .map(|shape| decode_polyline(shape).unwrap_or_default())
                .unwrap_or_default();

            HttpResponse::Ok().json(NavigationResponse {
                duration: format!("{}분", duration / 60),
                distance: format!("{:.1}km", distance),
                route: route.iter().map(|&(x, y)| Coordinate { latitude: x, longitude: y }).collect(),
                warnings: vec![],
            })
        }
        Ok(_) => HttpResponse::NotFound().json(json!({
            "error": "No valid route found for the given constraints."
        })),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to calculate route."
        })),
    }
}

fn decode_polyline(encoded: &str) -> Result<Vec<(f64, f64)>, String> {
    let mut index = 0;
    let mut lat: i64 = 0;
    let mut lon: i64 = 0;
    let mut coordinates = Vec::new();

    while index < encoded.len() {
        let mut result = 0;
        let mut shift = 0;

        // 위도 디코딩
        loop {
            if index >= encoded.len() {
                return Err("Invalid polyline string".to_string());
            }

            let byte = encoded.as_bytes()[index] as i64 - 63;
            index += 1;
            result |= (byte & 0x1F) << shift;
            shift += 5;

            if byte < 0x20 {
                break;
            }
        }

        let delta_lat = if (result & 1) != 0 { !(result >> 1) } else { result >> 1 };
        lat = lat.checked_add(delta_lat as i64).ok_or("Latitude overflow")?;

        result = 0;
        shift = 0;

        // 경도 디코딩
        loop {
            if index >= encoded.len() {
                return Err("Invalid polyline string".to_string());
            }

            let byte = encoded.as_bytes()[index] as i64 - 63;
            index += 1;
            result |= (byte & 0x1F) << shift;
            shift += 5;

            if byte < 0x20 {
                break;
            }
        }

        let delta_lon = if (result & 1) != 0 { !(result >> 1) } else { result >> 1 };
        lon = lon.checked_add(delta_lon as i64).ok_or("Longitude overflow")?;

        // ✅ EPSG:4326 좌표계로 변환 (1e5 나누기 적용)
        coordinates.push((lat as f64 / 1e6, lon as f64 / 1e6));
    }

    Ok(coordinates)
}
