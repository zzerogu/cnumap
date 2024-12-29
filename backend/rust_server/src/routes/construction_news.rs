use actix_web::web;
use crate::handlers::construction_news::{get_all_construction_news};

pub fn init_construction_news_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(get_all_construction_news);
}
