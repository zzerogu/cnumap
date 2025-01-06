use actix_web::web;
use crate::handlers::navigation::{calculate_route, get_node_coordinates, get_polygon_center};

pub fn init_navigation_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(calculate_route);
    cfg.service(get_node_coordinates);
    cfg.service(get_polygon_center);
}
