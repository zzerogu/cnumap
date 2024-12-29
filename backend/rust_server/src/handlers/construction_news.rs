use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use serde_json::json;
use crate::models::construction_news::ConstructionNews; // ConstructionNews 모델 가져오기
use crate::models::construction_news::ConstructionNewsResponse;

#[utoipa::path(
    get,
    path = "/api/construction-news",
    tag = "Construction News API",
    responses(
        (status = 200, description = "Retrieve all construction news", body = [ConstructionNewsResponse]),
        (status = 500, description = "Failed to retrieve construction news data")
    )
)]
#[get("/api/construction-news")]
async fn get_all_construction_news(pool: web::Data<PgPool>) -> impl Responder {
    let query = "SELECT * FROM Construction_News";

    match sqlx::query_as::<_, ConstructionNews>(query)
        .fetch_all(pool.get_ref())
        .await
    {
        Ok(news) => {
            let response: Vec<ConstructionNewsResponse> = news.into_iter().map(|n| n.into()).collect();
            HttpResponse::Ok().json(response)
        }
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve construction news data"
        })),
    }
}
