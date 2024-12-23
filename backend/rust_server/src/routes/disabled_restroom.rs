use actix_web::web;
use crate::handlers::disabled_restroom::{get_all_disabled_restrooms};

pub fn init_disabled_restroom_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(get_all_disabled_restrooms);
}
