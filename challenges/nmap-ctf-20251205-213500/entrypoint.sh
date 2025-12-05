#!/bin/bash
set -e

service ssh start
service vsftpd start
service apache2 start
service smbd start || service samba start || true

# Start inetd/xinetd for extra TCP services
service xinetd start || true

# Start UDP custom service
/usr/local/bin/udp_service.sh &

# Optional: simple TCP listener on 8080 for banner grabbing
while true; do echo "Nmap TCP Test Service" | nc -l -p 8080; done &

# Keep container running
sleep infinity
