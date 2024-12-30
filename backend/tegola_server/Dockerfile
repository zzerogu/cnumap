FROM debian:bullseye-slim

WORKDIR /tegola
# 로컬에서 빌드된 바이너리와 설정 파일 복사
COPY ./tegola /tegola/tegola
COPY ./config.toml /tegola/config.toml
# 작업 디렉토리 설정
WORKDIR /tegola

# 기본 명령어 설정
CMD ["./tegola", "serve"]
