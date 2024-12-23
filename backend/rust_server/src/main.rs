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

#[actix_web::main]
async fn main() -> std::io::Result<()> {
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

    // Actix 웹 서버 실행
    HttpServer::new(move || {
        let cors = Cors::default()
            .allow_any_origin()
            .allow_any_method()
            .allow_any_header()
            .max_age(3600);

        App::new()
            .wrap(cors) // CORS 설정 추가
            .app_data(web::Data::new(db_pool.clone())) // DB 풀 데이터 주입
            .configure(init_routes) // 라우트 초기화
    })
    .bind("0.0.0.0:8000")? // 서버 주소 바인딩
    .run()
    .await
}
