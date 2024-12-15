# Base image for PostGIS
FROM postgis/postgis:15-3.3

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=osm

# Create working directory
WORKDIR /docker-entrypoint-initdb.d

# Copy initialization SQL scripts
# 1. Extensions setup (PostGIS, hstore)
COPY init-extensions.sql /docker-entrypoint-initdb.d/

# Copy OSM data file for importing
# Ensure you replace `osm_data.osm.pbf` with the actual file path
COPY osm_data.osm.pbf /osm_data.osm.pbf

# Install additional tools like osm2pgsql
RUN apt-get update && \
    apt-get install -y osm2pgsql osmosis&& \
    rm -rf /var/lib/apt/lists/*

# Import OSM data during initialization
COPY import-osm.sh /usr/local/bin/import-osm.sh
RUN chmod +x /usr/local/bin/import-osm.sh

# Default command
CMD ["postgres"]
