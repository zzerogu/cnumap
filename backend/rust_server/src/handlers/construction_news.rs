use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use serde_json::json;
use crate::models::construction_news::ConstructionNews; // ConstructionNews 모델 가져오기

#[get("/api/construction-news")]
async fn get_all_construction_news(pool: web::Data<PgPool>) -> impl Responder {
    let query = "SELECT * FROM Construction_News";

    match sqlx::query_as::<_, ConstructionNews>(query)
        .fetch_all(pool.get_ref())
        .await
    {
        Ok(news) => HttpResponse::Ok().json(news),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve construction news data"
        })),
    }
}
