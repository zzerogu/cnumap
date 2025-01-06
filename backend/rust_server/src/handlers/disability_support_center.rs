use actix_web::{get, web, HttpResponse, Responder};
use sqlx::PgPool;
use serde_json::json;
use crate::models::disability_support_center::DisabilitySupportCenter;


#[utoipa::path(
    get,
    path = "/disability_support_centers",
    tag = "Disability Support Center API",
    responses(
        (status = 200, description = "List of all Disability Support Centers", body = [DisabilitySupportCenter]),
        (status = 500, description = "Error retrieving data")
    )
)]
#[get("/disability_support_centers")]
pub async fn get_all_disability_support_centers(
    pool: web::Data<sqlx::PgPool>
) -> impl Responder {
    match sqlx::query_as!(
        DisabilitySupportCenter,
        r#"
        SELECT id, name, position, phone_number, building_id
        FROM DisabilitySupportCenter
        "#
    )
    .fetch_all(pool.get_ref())
    .await {
        Ok(centers) => HttpResponse::Ok().json(centers),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}