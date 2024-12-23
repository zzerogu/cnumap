use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct Schedule {
    pub schedule_id: i32,
    pub lecture_id: i32,
    pub lecture_name: String,
    pub year: i32,
    pub semester: String,
    pub location: String,
    pub room_number: String,
    pub day_of_week: String,
    pub time: chrono::NaiveTime,
    pub professor_name: String,
}
