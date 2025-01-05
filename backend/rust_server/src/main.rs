mod handlers;
mod routes;
mod config;
mod db;
mod models;

use actix_cors::Cors; // CORS 설정
use actix_web::{App, HttpServer, web};
use config::app::get_config;
use sqlx::postgres::{PgPool, PgPoolOptions};
use routes::init_routes;
use dotenv::dotenv;
use utoipa::OpenApi; // OpenAPI 문서 생성
use utoipa_swagger_ui::SwaggerUi; // Swagger UI
use env_logger;

// OpenAPI 문서 정의
#[derive(OpenApi)]
#[openapi(
    paths(
        crate::handlers::building::get_buildings,
        crate::handlers::building::get_building_details,
        crate::handlers::building::get_building_node_details,
        crate::handlers::building::get_node_data,
        crate::handlers::building::search_buildings,
        crate::handlers::building::get_buildings_by_category,
        crate::handlers::building::get_buildings_by_tag,
        crate::handlers::construction_news::get_all_construction_news,
        crate::handlers::disabled_restroom::get_all_disabled_restrooms,
        crate::handlers::map::get_pbf_tile,
        crate::handlers::map::get_user_location,
        crate::handlers::navigation::calculate_route,
        crate::handlers::navigation::get_node_coordinates,
        crate::handlers::navigation::get_polygon_center,
        crate::handlers::ramp::get_all_ramps
    ),
    components(
        schemas(
            crate::models::building::Building,
            crate::handlers::building::BuildingSearchResponse,
            crate::handlers::building::MinimalBuilding,
            crate::models::construction_news::ConstructionNewsResponse,
            crate::models::disabled_restroom::DisabledRestroom,
            crate::models::ramp::Ramp,
            crate::handlers::navigation::Coordinate,
            crate::handlers::navigation::WheelchairVersion,
            crate::handlers::navigation::NavigationRequest,
            crate::handlers::navigation::NavigationResponse
        )
    ),
    tags(
        (name = "Building API", description = "건물 관련 API"),
        (name = "Construction News API", description = "공사 소식 관련 API"),
        (name = "Disabled Restroom API", description = "장애인 화장실 관련 API"),
        (name = "Map API", description = "지도 관련 API"),
        (name = "Navigation API", description = "길찾기 관련 API"),
        (name = "Ramp API", description = "램프 관련 API")
    )
)]
pub struct ApiDoc;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();
    env_logger::init();
    // 환경 변수에서 설정 로드
    let config = get_config();

    let max_connections: u32 = std::env::var("MAX_DB_CONNECTIONS")
        .unwrap_or_else(|_| "5".to_string())
        .parse()
        .expect("MAX_DB_CONNECTIONS must be a valid integer");

    // 데이터베이스 연결 풀 생성
    let db_pool: PgPool = PgPoolOptions::new()
        .max_connections(max_connections)
        .connect(&config.database_url)
        .await
        .expect("Failed to connect to the database");

    let db_pool_data = web::Data::new(db_pool);
    // OpenAPI 문서 생성
    let api_doc = ApiDoc::openapi();

    // Actix 웹 서버 실행
    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin()
            .allow_any_method()
            .allow_any_header()
            .max_age(3600);
    
        App::new()
            .wrap(cors)
            .app_data(db_pool_data.clone())
            .configure(init_routes)
            .service(
                SwaggerUi::new("/swagger-ui/{_:.*}") // Swagger UI 경로 설정
                    .url("/api-doc/openapi.json", ApiDoc::openapi()) // OpenAPI JSON 문서 경로 지정
            )
        
    })
    .bind("0.0.0.0:8000")?
    .run()
    .await
}
