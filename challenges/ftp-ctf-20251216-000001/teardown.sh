#!/bin/bash
set -euo pipefail

SLUG="ftp-ctf-20251216-000001"
CONTAINER_NAME="ctf_container_${SLUG}"
IMAGE_NAME="ctf_${SLUG}"

COMPOSE_FILE="docker-compose.yml"

if [ -f "$COMPOSE_FILE" ]; then
  docker compose down --remove-orphans || true
else
  docker rm -f "$CONTAINER_NAME" 2>/dev/null || true
fi

docker rmi "$IMAGE_NAME" 2>/dev/null || true
