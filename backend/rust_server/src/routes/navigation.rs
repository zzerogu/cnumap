use actix_web::web;
use crate::handlers::navigation::{calculate_route};

pub fn init_navigation_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(calculate_route);
}
