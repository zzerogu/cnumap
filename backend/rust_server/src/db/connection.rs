use sqlx::{Pool, Postgres};

pub async fn get_db_pool(database_url: &str) -> Pool<Postgres> {
    sqlx::PgPool::connect(database_url)
        .await
        .expect("Failed to connect to database")
}
