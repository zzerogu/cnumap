use actix_web::{get, HttpResponse, Responder};

#[get("/health")]
pub async fn health_check() -> impl Responder {
    HttpResponse::Ok().body("Server is healthy!")
}

pub fn init(cfg: &mut actix_web::web::ServiceConfig) {
    cfg.service(health_check);
}
