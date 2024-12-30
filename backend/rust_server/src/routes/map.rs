use actix_web::web;
use crate::handlers::map::{get_pbf_tile, get_user_location};

pub fn init_map_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(get_pbf_tile);
    cfg.service(get_user_location);
}
