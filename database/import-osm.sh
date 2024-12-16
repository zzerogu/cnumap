#!/bin/bash
set -e

# 경로 설정 (컨테이너 내부 기준)
INPUT_FILE="/osm_data.osm.pbf"
SORTED_FILE="/osm_data_sorted.osm.pbf"

# OSM 파일 정렬
osmosis --read-pbf file="$INPUT_FILE" --sort --write-pbf file="$SORTED_FILE"

# 정렬된 OSM 파일을 PostgreSQL에 입력
osm2pgsql -d osm -U "$POSTGRES_USER" --create --slim --hstore --host=localhost "$SORTED_FILE"
