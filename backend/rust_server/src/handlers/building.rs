use actix_web::{get, web, HttpResponse, Responder};
use serde_json::json;
use sqlx::PgPool;
use crate::models::{
    building::Building,
    disabled_restroom::DisabledRestroom,
    ramp::Ramp,
    elevator::Elevator,
};
use std::collections::HashMap;
use utoipa::ToSchema;
use serde::Serialize;
use log::{info, error};
use sqlx::FromRow;

#[derive(Debug, Serialize, FromRow, ToSchema)]
pub struct MinimalBuilding {
    pub building_id: i32,
    pub name: String,
    pub alias: Option<String>,
}

#[derive(Serialize, ToSchema)]
pub struct BuildingSearchResponse {
    pub building_id: i32,
    pub name: String,
    pub alias: Option<String>,
}

impl From<MinimalBuilding> for BuildingSearchResponse {
    fn from(building: MinimalBuilding) -> Self {
        BuildingSearchResponse {
            building_id: building.building_id,
            name: building.name,
            alias: building.alias,
        }
    }
}

#[utoipa::path(
    get,
    path = "/api/buildings",
    tag = "Building API",
    responses(
        (status = 200, description = "Retrieve all buildings", body = [BuildingSearchResponse]),
        (status = 500, description = "Internal server error")
    )
)]
#[get("/api/buildings")]
async fn get_buildings(pool: web::Data<PgPool>) -> impl Responder {
    let query = "SELECT building_id, name, alias FROM Building";

    info!("Starting to fetch buildings");

    match sqlx::query_as::<_, MinimalBuilding>(query)
        .fetch_all(pool.get_ref())
        .await
    {
        Ok(buildings) => {
            info!("Successfully fetched {} buildings", buildings.len());

            let response: Vec<BuildingSearchResponse> = buildings
                .into_iter()
                .map(BuildingSearchResponse::from)
                .collect();

            info!("Successfully transformed data into response format");

            HttpResponse::Ok().json(response)
        },
        Err(e) => {
            error!("Failed to fetch buildings: {:?}", e);

            HttpResponse::InternalServerError().json(json!({
                "error": "Failed to retrieve building data"
            }))
        },
    }
}

#[utoipa::path(
    get,
    path = "/api/buildings/{id}",
    params(
        ("id" = i32, Path, description = "Building ID to retrieve details")
    ),
    tag = "Building API",
    responses(
        (status = 200, description = "Retrieve building details including related data", body = Object),
        (status = 404, description = "Building not found"),
        (status = 500, description = "Internal server error")
    )
)]
#[get("/api/buildings/{id}")]
async fn get_building_details(
    pool: web::Data<PgPool>,
    path: web::Path<i32>,
) -> impl Responder {
    let building_id = path.into_inner();

    let building_query = "SELECT * FROM Building WHERE building_id = $1";
    let building = sqlx::query_as::<_, Building>(building_query)
        .bind(building_id)
        .fetch_one(pool.get_ref())
        .await;

    match building {
        Ok(building) => {
            let disabled_restrooms_query = "SELECT * FROM Disabled_Restroom WHERE building_id = $1";
            let ramps_query = "SELECT * FROM Ramp WHERE building_id = $1";
            let elevators_query = "SELECT * FROM Elevator WHERE building_id = $1";

            let disabled_restrooms = sqlx::query_as::<_, DisabledRestroom>(disabled_restrooms_query)
                .bind(building_id)
                .fetch_all(pool.get_ref())
                .await
                .unwrap_or_else(|_| vec![]);

            let ramps = sqlx::query_as::<_, Ramp>(ramps_query)
                .bind(building_id)
                .fetch_all(pool.get_ref())
                .await
                .unwrap_or_else(|_| vec![]);

            let elevators = sqlx::query_as::<_, Elevator>(elevators_query)
                .bind(building_id)
                .fetch_all(pool.get_ref())
                .await
                .unwrap_or_else(|_| vec![]);

            HttpResponse::Ok().json(json!({
                "building": building,
                "disabled_restrooms": disabled_restrooms,
                "ramps": ramps,
                "elevators": elevators,
            }))
        }
        Err(sqlx::Error::RowNotFound) => HttpResponse::NotFound().json(json!({
            "error": "Building not found"
        })),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve building details"
        })),
    }
}

#[utoipa::path(
    get,
    path = "/api/buildings_node/{id}",
    params(
        ("id" = String, Path, description = "Building ID to retrieve details")
    ),
    tag = "Building API",
    responses(
        (status = 200, description = "Retrieve building details including related data", body = Object),
        (status = 404, description = "Building not found"),
        (status = 500, description = "Internal server error")
    )
)]
#[get("/api/buildings_node/{id}")]
async fn get_building_node_details(
    pool: web::Data<PgPool>,
    path: web::Path<String>,
) -> impl Responder {
    let node_id = path.into_inner();

    let building_query = "SELECT * FROM Building WHERE node_id = $1";
    let building = sqlx::query_as::<_, Building>(building_query)
        .bind(&node_id)
        .fetch_one(pool.get_ref())
        .await;

    match building {
        Ok(building) => {
            let building_id = building.building_id; 

            let disabled_restrooms_query = "SELECT * FROM Disabled_Restroom WHERE building_id = $1";
            let ramps_query = "SELECT * FROM Ramp WHERE building_id = $1";
            let elevators_query = "SELECT * FROM Elevator WHERE building_id = $1";

            let disabled_restrooms = sqlx::query_as::<_, DisabledRestroom>(disabled_restrooms_query)
                .bind(building_id)
                .fetch_all(pool.get_ref())
                .await
                .unwrap_or_else(|_| vec![]);

            let ramps = sqlx::query_as::<_, Ramp>(ramps_query)
                .bind(building_id)
                .fetch_all(pool.get_ref())
                .await
                .unwrap_or_else(|_| vec![]);

            let elevators = sqlx::query_as::<_, Elevator>(elevators_query)
                .bind(building_id)
                .fetch_all(pool.get_ref())
                .await
                .unwrap_or_else(|_| vec![]);

            HttpResponse::Ok().json(json!({
                "building": building,
                "disabled_restrooms": disabled_restrooms,
                "ramps": ramps,
                "elevators": elevators,
            }))
        }
        Err(sqlx::Error::RowNotFound) => HttpResponse::NotFound().json(json!({
            "error": "Building not found"
        })),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve building details"
        })),
    }
}

#[utoipa::path(
    get,
    path = "/api/nodes/{node_id}",
    params(
        ("node_id" = String, Path, description = "Node ID to fetch data"),
        ("table" = String, Query, description = "Table name (Disabled_Restroom, Ramp, Elevator)")
    ),
    tag = "Node API",
    responses(
        (status = 200, description = "Retrieve node data", body = Object),
        (status = 400, description = "Invalid table name"),
        (status = 404, description = "No data found"),
        (status = 500, description = "Query failed")
    )
)]
#[get("/api/nodes/{node_id}")]
async fn get_node_data(
    pool: web::Data<PgPool>,
    path: web::Path<String>,
    query: web::Query<HashMap<String, String>>,
) -> impl Responder {
    let node_id = path.into_inner();
    let table_name = query.get("table").map(String::as_str);

    let valid_tables = vec!["Disabled_Restroom", "Ramp", "Elevator"];
    if !valid_tables.contains(&table_name.unwrap_or("")) {
        return HttpResponse::BadRequest().json(json!({
            "error": "Invalid table name"
        }));
    }

    match table_name.unwrap() {
        "Disabled_Restroom" => {
            let result = sqlx::query_as::<_, DisabledRestroom>("SELECT * FROM Disabled_Restroom WHERE node_id = $1")
                .bind(node_id)
                .fetch_optional(pool.get_ref())
                .await;

            match result {
                Ok(Some(row)) => HttpResponse::Ok().json(json!({ "data": row })),
                Ok(None) => HttpResponse::NotFound().json(json!({ "error": "No data found" })),
                Err(_) => HttpResponse::InternalServerError().json(json!({ "error": "Query failed" })),
            }
        }
        "Ramp" => {
            let result = sqlx::query_as::<_, Ramp>("SELECT * FROM Ramp WHERE node_id = $1")
                .bind(node_id)
                .fetch_optional(pool.get_ref())
                .await;

            match result {
                Ok(Some(row)) => HttpResponse::Ok().json(json!({ "data": row })),
                Ok(None) => HttpResponse::NotFound().json(json!({ "error": "No data found" })),
                Err(_) => HttpResponse::InternalServerError().json(json!({ "error": "Query failed" })),
            }
        }
        "Elevator" => {
            let result = sqlx::query_as::<_, Elevator>("SELECT * FROM Elevator WHERE node_id = $1")
                .bind(node_id)
                .fetch_optional(pool.get_ref())
                .await;

            match result {
                Ok(Some(row)) => HttpResponse::Ok().json(json!({ "data": row })),
                Ok(None) => HttpResponse::NotFound().json(json!({ "error": "No data found" })),
                Err(_) => HttpResponse::InternalServerError().json(json!({ "error": "Query failed" })),
            }
        }
        _ => HttpResponse::BadRequest().json(json!({ "error": "Invalid table name" })),
    }
}

#[utoipa::path(
    get,
    path = "/api/building",
    params(
        ("name" = String, Query, description = "Optional building name to search for partial matches")
    ),
    tag = "Building API",
    responses(
        (status = 200, description = "Retrieve list of buildings", body = [Object]),
        (status = 500, description = "Internal server error")
    )
)]

#[get("/api/building")]
async fn search_buildings(
    pool: web::Data<PgPool>,
    query: web::Query<HashMap<String, String>>,
) -> impl Responder {
    let name_filter = query.get("name").map(|name| format!("%{}%", name));

    let query = match name_filter {
        Some(name) => {
            sqlx::query_as::<_, Building>(
                "SELECT * FROM Building WHERE name LIKE $1"
            )
            .bind(name)
        }
        None => {
            sqlx::query_as::<_, Building>(
                "SELECT * FROM Building"
            )
        }
    };

    match query.fetch_all(pool.get_ref()).await {
        Ok(buildings) => HttpResponse::Ok().json(buildings),
        Err(_) => HttpResponse::InternalServerError().json(json!({
            "error": "Failed to retrieve buildings data"
        })),
    }
}

#[utoipa::path(
    get,
    path = "/api/building/category",
    params(
        ("category" = String, Query, description = "Category to filter buildings")
    ),
    tag = "Building API",
    responses(
        (status = 200, description = "Retrieve buildings by category", body = [Object]),
        (status = 500, description = "Internal server error")
    )
)]
#[get("/api/building/category")]
async fn get_buildings_by_category(
    pool: web::Data<PgPool>,
    query: web::Query<HashMap<String, String>>,
) -> impl Responder {
    let category_filter = query.get("category").map(|category| category.clone());

    if let Some(category) = category_filter {
        let query = sqlx::query_as::<_, Building>(
            "SELECT * FROM Building WHERE category = $1"
        )
        .bind(category);

        match query.fetch_all(pool.get_ref()).await {
            Ok(buildings) => {
                HttpResponse::Ok().json(buildings)
            }
            Err(_) => HttpResponse::InternalServerError().json(json!({
                "error": "Failed to retrieve buildings by category"
            })),
        }
    } else {
        HttpResponse::BadRequest().json(json!({ "error": "Category parameter is required" }))
    }
}

#[utoipa::path(
    get,
    path = "/api/building/tag",
    params(
        ("tag" = String, Query, description = "Tag to filter buildings")
    ),
    tag = "Building API",
    responses(
        (status = 200, description = "Retrieve buildings by tag", body = [Object]),
        (status = 500, description = "Internal server error")
    )
)]
#[get("/api/building/tag")]
async fn get_buildings_by_tag(
    pool: web::Data<PgPool>,
    query: web::Query<HashMap<String, String>>,
) -> impl Responder {
    let tag_filter = query.get("tag").map(|tag| tag.clone());

    if let Some(tag) = tag_filter {
        let query = sqlx::query_as::<_, Building>(
            "SELECT * FROM Building WHERE tags LIKE $1"
        )
        .bind(format!("%{}%", tag));

        match query.fetch_all(pool.get_ref()).await {
            Ok(buildings) => {
                HttpResponse::Ok().json(buildings)
            }
            Err(_) => HttpResponse::InternalServerError().json(json!({
                "error": "Failed to retrieve buildings by tag"
            })),
        }
    } else {
        HttpResponse::BadRequest().json(json!({ "error": "Tag parameter is required" }))
    }
}