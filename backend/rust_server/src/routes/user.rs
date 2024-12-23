use actix_web::{get, HttpResponse, Responder};

#[get("/user")]
pub async fn get_user() -> impl Responder {
    HttpResponse::Ok().body("User route")
}

pub fn init(cfg: &mut actix_web::web::ServiceConfig) {
    cfg.service(get_user);
}
