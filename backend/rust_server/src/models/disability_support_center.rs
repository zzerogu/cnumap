// models/disability_support_center.rs
use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use utoipa::ToSchema;

#[derive(Debug, Serialize, Deserialize, FromRow, Clone, ToSchema)]
pub struct DisabilitySupportCenter {
    pub id: i32,
    pub name: String,
    pub position: String,
    pub phone_number: String,
    pub building_id: i32,
}