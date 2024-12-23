use actix_web::{get, web, HttpResponse, Responder};
use awc::Client; 
use serde_json::json;

// PBF Tile 라우트
#[get("/api/map/tiles/{z}/{x}/{y}.pbf")]
async fn get_pbf_tile(
    path: web::Path<(u32, u32, u32)>,
) -> impl Responder {
    let (z, x, y) = path.into_inner();
    let tegola_url = format!("http://tegola_server:8080/maps/osm_map/{}/{}/{}.pbf", z, x, y);

    // (1) 여기서 매 요청마다 AWC Client 생성
    let client = Client::new();

    match client.get(tegola_url).send().await {
        Ok(mut response) => {
            if response.status().is_success() {
                match response.body().await {
                    Ok(body) => HttpResponse::Ok()
                        .content_type("application/x-protobuf")
                        .body(body),
                    Err(_) => HttpResponse::InternalServerError().json(json!({
                        "error": "Failed to read tile data from response"
                    })),
                }
            } else {
                HttpResponse::NotFound().json(json!({
                    "error": "Tile not found"
                }))
            }
        }
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to fetch tile"
        })),
    }
}



#[get("/api/user/location")]
async fn get_user_location() -> impl Responder {
    // 예제로 고정된 위치 값을 반환
    let latitude = 37.5665;  // 서울 중심
    let longitude = 126.9780; // 서울 중심

    HttpResponse::Ok().json(json!({
        "latitude": latitude,
        "longitude": longitude
    }))
}
