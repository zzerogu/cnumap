#!/bin/bash
set -e

# Sort the OSM file
osmosis --read-pbf file=/osm_data.osm.pbf --sort --write-pbf file=/osm_data_sorted.osm.pbf

# Import sorted OSM file into the database
osm2pgsql -d osm -U $POSTGRES_USER --create --slim --hstore --host=localhost /osm_data_sorted.osm.pbf
