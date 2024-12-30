# Base image for PostGIS
FROM postgis/postgis:15-3.3

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=osm

# Install additional tools
RUN apt-get update && \
    apt-get install -y osm2pgsql osmosis && \
    rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /docker-entrypoint-initdb.d

# Copy initialization scripts
COPY init-extensions.sql /docker-entrypoint-initdb.d/00-init-extensions.sql
COPY init-tables.sql /docker-entrypoint-initdb.d/01-init-tables.sql
COPY init-data.sql /docker-entrypoint-initdb.d/02-init-data.sql
COPY import-osm.sh /docker-entrypoint-initdb.d/03-import-osm.sh

# Copy OSM data file
COPY osm_data.osm.pbf /osm_data.osm.pbf

RUN chown postgres:postgres /osm_data.osm.pbf && chmod 644 /osm_data.osm.pbf

# Default command to start PostgreSQL
CMD ["postgres"]
