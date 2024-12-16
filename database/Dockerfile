# Base image for PostGIS
FROM postgis/postgis:15-3.3

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=osm

# Create working directory
WORKDIR /docker-entrypoint-initdb.d

# Copy initialization SQL scripts
COPY init-extensions.sql /docker-entrypoint-initdb.d/
COPY init-tables.sql /docker-entrypoint-initdb.d/
COPY init-data.sql /docker-entrypoint-initdb.d/
# Copy OSM data file for importing
COPY osm_data.osm.pbf /osm_data.osm.pbf

# Install additional tools like osm2pgsql
RUN apt-get update && \
    apt-get install -y osm2pgsql osmosis && \
    rm -rf /var/lib/apt/lists/*

# Copy and make import script executable
COPY import-osm.sh /usr/local/bin/import-osm.sh
RUN chmod +x /usr/local/bin/import-osm.sh

# Combine default Postgres command with the import script
CMD ["bash", "-c", "postgres & sleep 5 && /usr/local/bin/import-osm.sh && wait"]
