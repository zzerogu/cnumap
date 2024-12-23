use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct ConstructionNews {
    pub news_id: i32,
    pub content: String,
    pub location: String,
    pub start_time: NaiveDateTime,
    pub end_time: NaiveDateTime,
}
