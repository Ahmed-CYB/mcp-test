#!/bin/bash
set -euo pipefail

SLUG="http-ctf-20251216-000001"

# Stop and remove container if exists
if docker ps -a --format '{{.Names}}' | grep -q "^ctf_container_${SLUG}$"; then
  docker stop ctf_container_${SLUG} >/dev/null 2>&1 || true
  docker rm ctf_container_${SLUG} >/dev/null 2>&1 || true
fi

# Optionally remove image
if docker images --format '{{.Repository}}' | grep -q "^ctf_${SLUG}$"; then
  docker rmi ctf_${SLUG} >/dev/null 2>&1 || true
fi
