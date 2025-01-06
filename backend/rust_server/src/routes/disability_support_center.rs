use actix_web::web;
use crate::handlers::disability_support_center::{get_all_disability_support_centers};

pub fn init_disability_support_center_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(get_all_disability_support_centers);
}
