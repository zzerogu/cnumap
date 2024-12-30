use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use crate::models::ramp::Ramp; // Ramp 모델 가져오기
use serde_json::json;
use utoipa::path; // Swagger 문서화를 위한 매크로 추가

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

    match sqlx::query_as::<_, Ramp>(query)
        .fetch_all(pool.get_ref())
        .await
    {
        Ok(ramps) => HttpResponse::Ok().json(ramps),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve ramps data"
        })),
    }
}
