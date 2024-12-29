use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use utoipa::ToSchema;

#[derive(Debug, Serialize, Deserialize, FromRow, Clone, ToSchema)]
pub struct Building {
    pub building_id: i32,                  // 건물 ID (Primary Key)
    pub node_id: String,                  // 노드 ID
    pub name: String,                     // 건물 이름
    pub alias: Option<String>,            // 별칭 (Optional)
    pub category: Option<String>,         // 카테고리 (Optional)
    pub basement_floors: i32,             // 지하 층수
    pub ground_floors: i32,               // 지상 층수
    pub roof_floors: i32,                 // 옥상 층수
    pub address: String,                  // 주소
    pub phone_number: Option<String>,     // 전화번호 (Optional)
    pub tags: Option<String>,             // 태그 (Optional, 예: "편의점, 휠체어 충전소, 카페")
}