#!/bin/bash
set -euo pipefail

SLUG="http-ctf-20251216-000001"
TTL=1800

# Find a free port
get_free_port() {
  python - << 'EOF'
import socket
s = socket.socket()
s.bind(("", 0))
port = s.getsockname()[1]
s.close()
print(port)
EOF
}

RETRY=0
MAX_RETRY=1

while true; do
  PORT=$(get_free_port) || true
  if [ -z "${PORT:-}" ]; then
    if [ "$RETRY" -ge "$MAX_RETRY" ]; then
      exit 1
    fi
    RETRY=$((RETRY+1))
    sleep 2
    continue
  fi

  if docker build -t ctf_${SLUG} challenges/${SLUG}/ >/dev/null 2>&1; then
    if CONTAINER_ID=$(docker run -d -p ${PORT}:8080 --name ctf_container_${SLUG} ctf_${SLUG} 2>/dev/null); then
      break
    fi
  fi

  if [ "$RETRY" -ge "$MAX_RETRY" ]; then
    exit 1
  fi
  RETRY=$((RETRY+1))
  sleep 2
done

# Health check
for i in {1..10}; do
  if curl -sSf http://localhost:${PORT}/ >/dev/null 2>&1; then
    break
  fi
  sleep 2
done

# Schedule teardown
if [ "$TTL" -gt 0 ]; then
  (nohup bash -c "sleep $TTL && challenges/${SLUG}/teardown.sh" >/dev/null 2>&1 &)
fi

# Output JSON only
cat <<EOF
{"slug":"${SLUG}","deployment_mode":"docker","containers":["ctf_container_${SLUG}"],"ports":{"http":"${PORT}"},"status":"running","service_url":"http://localhost:${PORT}/"}
EOF
