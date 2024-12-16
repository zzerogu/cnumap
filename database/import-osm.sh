#!/bin/bash
set -e

echo "Waiting for PostgreSQL to start..."

# 최대 대기 시간 설정 (초)
timeout=60
elapsed=0

# # PostgreSQL 준비 상태를 확인하는 루프
while ! psql -U postgres -d osm -c '\l' >/dev/null 2>&1; do
  echo "PostgreSQL is not ready yet. Retrying..."
  sleep 2
  elapsed=$((elapsed+2))
  if [ $elapsed -ge $timeout ]; then
    echo "Error: PostgreSQL did not become ready within $timeout seconds."
    exit 1
  fi
done

echo "PostgreSQL is ready. Importing OSM data..."

ls -l /osm_data.osm.pbf
# OSM 파일 정렬
osmosis --read-pbf file=/osm_data.osm.pbf --sort --write-pbf file=/tmp/osm_data_sorted.osm.pbf
osm2pgsql -d osm -U postgres --create --slim --hstore /tmp/osm_data_sorted.osm.pbf


echo "OSM data import completed."
