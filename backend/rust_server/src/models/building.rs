use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct Building {
    pub building_id: i32,
    pub node_id: String,
    pub name: String,
    pub alias: Option<String>,
    pub category: String,
    pub basement_floors: i32, // 지하 층수
    pub ground_floors: i32,   // 지상 층수
    pub roof_floors: i32,     // 옥상 층수
}
