use actix_web::web;

pub mod building;
pub mod construction_news;
pub mod disabled_restroom;
pub mod map;
pub mod navigation;
pub mod ramp;
pub mod disability_support_center;

pub fn init_routes(cfg: &mut web::ServiceConfig) {
    building::init_building_routes(cfg);
    construction_news::init_construction_news_routes(cfg);
    disabled_restroom::init_disabled_restroom_routes(cfg);
    map::init_map_routes(cfg);
    navigation::init_navigation_routes(cfg);
    ramp::init_ramp_routes(cfg);
    disability_support_center::init_disability_support_center_routes(cfg);
}
