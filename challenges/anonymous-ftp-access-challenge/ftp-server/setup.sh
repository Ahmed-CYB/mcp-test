#!/bin/bash

# CTF Challenge Setup Script
# Anonymous FTP Access Challenge

echo "[+] Setting up Anonymous FTP Access Challenge..."

# Create directory structure
echo "[+] Creating FTP directory structure..."
mkdir -p ftp_data/{public,reports,backups,temp}

# Copy files to appropriate locations
cp welcome.txt ftp_data/
cp public/* ftp_data/public/ 2>/dev/null || true
cp reports/* ftp_data/reports/ 2>/dev/null || true
cp backups/* ftp_data/backups/ 2>/dev/null || true
cp temp/* ftp_data/temp/ 2>/dev/null || true

# Set proper permissions
echo "[+] Setting permissions..."
chmod 755 ftp_data
chmod -R 644 ftp_data/*
chmod 755 ftp_data/public ftp_data/reports ftp_data/backups ftp_data/temp

# Make backups directory appear restricted but readable
chmod 750 ftp_data/backups

# Create SSH config directory
mkdir -p ssh_config

# Start services
echo "[+] Starting services..."
docker-compose up -d

echo "[+] Waiting for services to start..."
sleep 10

# Verify services
echo "[+] Verifying services..."
if docker ps | grep -q "ftp-server"; then
    echo "[✓] FTP server is running"
else
    echo "[✗] FTP server failed to start"
fi

if docker ps | grep -q "ssh-server"; then
    echo "[✓] SSH server is running"
else
    echo "[✗] SSH server failed to start"
fi

echo ""
echo "=== Challenge Information ==="
echo "Target: localhost"
echo "FTP Port: 21"
echo "SSH Port: 22"
echo "Anonymous FTP: Enabled"
echo "Flag Location: /backups/credentials.txt"
echo ""
echo "=== Attack Path ==="
echo "1. Scan target for open ports"
echo "2. Discover FTP service on port 21"
echo "3. Attempt anonymous FTP login"
echo "4. Enumerate directory structure"
echo "5. Access restricted /backups directory"
echo "6. Retrieve credentials.txt containing flag"
echo ""
echo "Challenge ready! Happy hacking!"
