use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use serde_json::json;
use crate::models::disabled_restroom::DisabledRestroom; // DisabledRestroom 모델 가져오기

#[get("/api/disabled_restrooms")]
async fn get_all_disabled_restrooms(pool: web::Data<PgPool>) -> impl Responder {
    let query = "SELECT * FROM Disabled_Restroom";

    match sqlx::query_as::<_, DisabledRestroom>(query)
        .fetch_all(pool.get_ref())
        .await
    {
        Ok(restrooms) => HttpResponse::Ok().json(restrooms),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve disabled restrooms data"
        })),
    }
}
