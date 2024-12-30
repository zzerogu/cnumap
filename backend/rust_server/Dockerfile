# Rust 빌드 이미지
FROM rust:slim-bookworm AS builder

# 작업 디렉토리 설정
WORKDIR /app

# 프로젝트 파일 복사 및 의존성 가져오기
COPY Cargo.toml Cargo.lock ./
RUN cargo fetch

# 소스 코드 및 migrations 디렉토리 복사
COPY . .

# 빌드 시 필요한 환경 변수 전달
ARG DATABASE_URL

# 필요한 라이브러리 설치 및 sqlx-cli 설치
RUN apt-get update && apt-get install -y libssl-dev pkg-config \
    && cargo install sqlx-cli --no-default-features --features native-tls,postgres

RUN cargo sqlx prepare --database-url ${DATABASE_URL}
# 프로젝트 빌드
RUN cargo build --release

# 런타임 이미지
FROM debian:bookworm-slim

# 필요한 라이브러리 설치
RUN apt-get update && apt-get install -y \
    libssl3 ca-certificates tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone && \
    rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# 빌드된 바이너리 복사
COPY --from=builder /app/target/release/rust_server /usr/local/bin/rust_server

# migrations 디렉토리 복사
COPY --from=builder /app/migrations ./migrations

# 포트 노출 및 실행 명령어 설정
EXPOSE 8000
CMD ["rust_server"]
