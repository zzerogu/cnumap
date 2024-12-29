use serde::Deserialize;

#[derive(Deserialize)]
pub struct Config {
    pub database_url: String,
}

pub fn get_config() -> Config {
    dotenv::dotenv().ok(); // .env 파일 로드
    envy::from_env::<Config>().expect("Failed to load configuration")
}
