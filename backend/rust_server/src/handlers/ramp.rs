use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use crate::models::ramp::Ramp; // Ramp 모델 가져오기
use serde_json::json;
use log::{info, error}; // 로깅 추가
 // Swagger 문서화를 위한 매크로 추가

#[utoipa::path(
    get,
    path = "/api/ramps",
    tag = "Ramp API",
    responses(
        (status = 200, description = "Retrieve all ramps", body = [Ramp]),
        (status = 500, description = "Failed to retrieve ramps data")
    )
)]
#[get("/api/ramps")]
async fn get_all_ramps(pool: web::Data<PgPool>) -> impl Responder {
    let query = "SELECT * FROM Ramp";

    info!("Starting to fetch ramps"); // 시작 로그 추가

    match sqlx::query_as::<_, Ramp>(query)
        .fetch_all(pool.get_ref())
        .await
    {
        Ok(ramps) => {
            info!("Successfully fetched {} ramps", ramps.len()); // 성공 로그 추가
            HttpResponse::Ok().json(ramps)
        },
        Err(e) => {
            error!("Failed to fetch ramps: {:?}", e); // 에러 로그 추가
            HttpResponse::InternalServerError().json(json!({
                "error": "Failed to retrieve ramps data"
            }))
        },
    }
}