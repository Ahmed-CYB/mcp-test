#!/bin/bash
set -euo pipefail

SLUG="ftp-ctf-20251216-000001"
IMAGE_NAME="ctf_${SLUG}"
CONTAINER_NAME="ctf_container_${SLUG}"
TTL=${TTL:-1800}

find_free_port() {
  python3 - "$@" << 'PY'
import socket
import sys

start = int(sys.argv[1])
end = int(sys.argv[2])

for port in range(start, end + 1):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        if s.connect_ex(("127.0.0.1", port)) != 0:
            print(port)
            sys.exit(0)

sys.exit(1)
PY
}

COMPOSE_FILE="docker-compose.yml"

if [ -f "$COMPOSE_FILE" ]; then
  deployment_mode="compose"
  docker compose down --remove-orphans || true
  docker compose build --pull --no-cache || docker compose build || true
  docker compose up -d || {
    sleep 5
    docker compose up -d
  }

  FTP_PORT=$(docker compose port ${CONTAINER_NAME} 21 | awk -F: 'NR==1 {print $2}')
else
  deployment_mode="docker"
  FTP_PORT=$(find_free_port 20000 21000)

  docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

  docker build -t "$IMAGE_NAME" . || {
    sleep 5
    docker build -t "$IMAGE_NAME" .
  }

  docker run -d \
    --name "$CONTAINER_NAME" \
    -p "${FTP_PORT}:21" \
    "$IMAGE_NAME"
fi

health_check() {
  for i in {1..10}; do
    if docker exec "$CONTAINER_NAME" bash -c "nc -z localhost 21" >/dev/null 2>&1; then
      return 0
    fi
    sleep 3
  done
  return 1
}

health_check

if [ "$TTL" -gt 0 ]; then
  nohup bash -c "sleep $TTL && ./teardown.sh" >/dev/null 2>&1 &
fi

SERVICE_URL="ftp://127.0.0.1:${FTP_PORT}"

jq -n \
  --arg slug "$SLUG" \
  --arg mode "$deployment_mode" \
  --arg container "$CONTAINER_NAME" \
  --arg ftp_port "$FTP_PORT" \
  --arg service_url "$SERVICE_URL" \
  '{slug: $slug, deployment_mode: $mode, containers: [$container], ports: {"ftp": $ftp_port}, status: "running", service_url: $service_url}'
