use actix_web::{post, web, HttpResponse, Responder};
use serde::{Deserialize, Serialize};
use serde_json::json;
use reqwest::Client;
use utoipa::{ToSchema}; // ToSchema 추가

#[derive(Debug, Deserialize, ToSchema)]
pub struct NavigationRequest {
    start: Coordinate,
    end: Coordinate,
    min_slope: f32,
    max_slope: f32,
    avoid_areas: Option<Vec<AvoidArea>>,
}

#[derive(Debug, Deserialize, Serialize, ToSchema)]
pub struct Coordinate {
    latitude: f64,
    longitude: f64,
}

#[derive(Debug, Deserialize, ToSchema)]
pub struct AvoidArea {
    min_latitude: f64,
    min_longitude: f64,
    max_latitude: f64,
    max_longitude: f64,
}

#[derive(Debug, Serialize, ToSchema)]
pub struct NavigationResponse {
    duration: String,
    distance: String,
    route: Vec<Coordinate>,
    warnings: Vec<String>,
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

    if request.min_slope > request.max_slope {
        return HttpResponse::BadRequest().json(json!({
            "error": "Invalid slope range. Ensure min_slope <= max_slope."
        }));
    }

    let valhalla_url = "http://localhost:8002/route";
    let valhalla_request = json!({
        "locations": [
            { "lat": request.start.latitude, "lon": request.start.longitude },
            { "lat": request.end.latitude, "lon": request.end.longitude }
        ],
        "costing": "pedestrian",
        "costing_options": {
            "pedestrian": {
                "min_slope": request.min_slope,
                "max_slope": request.max_slope
            }
        },
        "avoid_polygons": request.avoid_areas.map(|areas| {
            areas.into_iter().map(|area| {
                json!({
                    "type": "Polygon",
                    "coordinates": [[
                        [area.min_longitude, area.min_latitude],
                        [area.max_longitude, area.min_latitude],
                        [area.max_longitude, area.max_latitude],
                        [area.min_longitude, area.max_latitude],
                        [area.min_longitude, area.min_latitude]
                    ]]
                })
            }).collect::<Vec<_>>()
        })
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
                route: route.iter().map(|&(lat, lon)| Coordinate { latitude: lat, longitude: lon }).collect(),
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

// Polyline 디코딩 함수 (샘플)
fn decode_polyline(encoded: &str) -> Result<Vec<(f64, f64)>, String> {
    Ok(vec![]) // 샘플 리턴
}
