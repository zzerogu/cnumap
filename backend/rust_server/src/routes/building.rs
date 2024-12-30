use actix_web::web;
use crate::handlers::building::{get_buildings_by_category, get_buildings_by_tag, search_buildings, get_buildings, get_building_details, get_node_data};

pub fn init_building_routes(cfg: &mut web::ServiceConfig) {
    cfg.service(get_buildings);
    cfg.service(get_building_details);
    cfg.service(get_node_data);
    cfg.service(search_buildings);
    cfg.service(get_buildings_by_category);
    cfg.service(get_buildings_by_tag);
}
