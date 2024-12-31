# Stage 1: Build environment
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential cmake git curl wget \
    libboost-all-dev libcurl4-openssl-dev \
    liblz4-dev libsqlite3-dev zlib1g-dev \
    protobuf-compiler libprotobuf-dev jq pkg-config \
    libzmq3-dev libczmq-dev libspatialite-dev luajit libluajit-5.1-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Valhalla source code
COPY ./valhalla /app/valhalla

# Install PrimeServer
WORKDIR /tmp
RUN git clone https://github.com/kevinkreiser/prime_server.git && \
    cd prime_server && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && \
    make -j$(nproc) && \
    make install && \
    cd /tmp && rm -rf prime_server

# Build Valhalla
WORKDIR /app/valhalla
RUN rm -rf build && mkdir build && cd build && \
    cmake .. && \
    make -j1 && \
    make install && \
    cd /app && rm -rf /app/valhalla/build

RUN mkdir -p /data/valhalla && chmod -R 777 /data/valhalla
# Copy configuration and data
COPY ./valhalla.json /data/valhalla/valhalla.json

# Copy prebuilt tiles from local machine
COPY ./tiles /data/valhalla/tiles
COPY ./duplicateways.txt /data/valhalla/duplicateways.txt

RUN tar -cvf /data/valhalla/tiles.tar -C /data/valhalla tiles && \
    rm -rf /data/valhalla/tiles

ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

WORKDIR /data/valhalla
# Expose the default Valhalla port
EXPOSE 8002
# Run Valhalla service
CMD ["valhalla_service", "/data/valhalla/valhalla.json", "1"]
