use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;
use sqlx::FromRow;

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct ConstructionNews {
    pub news_id: i32,
    pub content: String,
    pub location: String,
    pub start_time: NaiveDateTime,
    pub end_time: NaiveDateTime,
}

#[derive(Debug, Serialize, ToSchema)]
pub struct ConstructionNewsResponse {
    pub news_id: i32,
    pub content: String,
    pub location: String,
    #[schema(value_type = String, example = "2024-12-28T12:00:00")]
    pub start_time: String,
    #[schema(value_type = String, example = "2024-12-29T12:00:00")]
    pub end_time: String,
}

impl From<ConstructionNews> for ConstructionNewsResponse {
    fn from(news: ConstructionNews) -> Self {
        ConstructionNewsResponse {
            news_id: news.news_id,
            content: news.content,
            location: news.location,
            start_time: news.start_time.format("%Y-%m-%dT%H:%M:%S").to_string(),
            end_time: news.end_time.format("%Y-%m-%dT%H:%M:%S").to_string(),
        }
    }
}
