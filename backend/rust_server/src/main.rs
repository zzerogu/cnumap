use actix_web::{web, App, HttpServer, Responder, HttpResponse};
use serde::Deserialize;

#[derive(Deserialize)]
struct RouteQuery {
    start: String,
    end: String,
}

// Route API 예제
async fn route(query: web::Query<RouteQuery>) -> impl Responder {
    HttpResponse::Ok().json(format!(
        "Calculating route from {} to {}",
        query.start, query.end
    ))
}

// 서버 실행
#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Starting server at http://localhost:8000...");
    HttpServer::new(|| {
        App::new()
            .route("/api/status", web::get().to(|| async { "Server is running!" }))
            .route("/api/route", web::get().to(route))
    })
    .bind("0.0.0.0:8000")?
    .run()
    .await
}
