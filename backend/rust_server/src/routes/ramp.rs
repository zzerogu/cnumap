use actix_web::web;
use crate::handlers::ramp::{get_all_ramps};

pub fn init_ramp_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(get_all_ramps);
}
