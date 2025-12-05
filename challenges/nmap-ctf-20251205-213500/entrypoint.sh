#!/bin/bash
set -e

# Write flag in an unobvious place for the CTF
mkdir -p /opt/.secrets
# Hidden flag file; students will likely find it by thorough enumeration
cat << 'EOF' > /opt/.secrets/.nmap_lab_flag
FLAG{nmap_all_the_things_UDP_TCP_NSE_2025}
EOF
chmod 600 /opt/.secrets/.nmap_lab_flag

# Start standard services
service ssh start || /usr/sbin/sshd || true
service vsftpd start || true
service apache2 start || true
service smbd start || true

# Start xinetd for custom TCP banner service
service xinetd start || /usr/sbin/xinetd -stayalive -dontfork || true

# Simple HTTP banner on 8080 (if not already in Apache config)
# python3 -m http.server 8080 &>/dev/null &

# Custom UDP echo-like service for Nmap UDP scans on 9999/udp
while true; do
  # Use nc in UDP listen mode to respond with a fixed banner
  echo "Nmap-UDP-Lab-Service" | nc -u -l -p 9999 -q 1 || true
done &

# Keep container alive
sleep infinity
