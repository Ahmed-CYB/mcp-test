#!/bin/bash
# Network reconnaissance script
# Usage: ./network_scan.sh [target_range]

TARGET=${1:-"192.168.1.0/24"}
OUTPUT_DIR="/home/admin/scans"
DATE=$(date +"%Y%m%d_%H%M%S")

echo "Starting network scan of $TARGET"
echo "Results will be saved to $OUTPUT_DIR"

mkdir -p $OUTPUT_DIR

# Host discovery
echo "[+] Performing host discovery..."
nmap -sn $TARGET > "$OUTPUT_DIR/hosts_$DATE.txt"

# Port scanning
echo "[+] Scanning common ports..."
nmap -sS -O -sV -p- --script=default $TARGET > "$OUTPUT_DIR/portscan_$DATE.txt"

# Service enumeration
echo "[+] Enumerating services..."
nmap --script=smb-enum-shares,ftp-anon,snmp-info $TARGET > "$OUTPUT_DIR/services_$DATE.txt"

# Vulnerability scanning
echo "[+] Running vulnerability checks..."
nmap --script=vuln $TARGET > "$OUTPUT_DIR/vulns_$DATE.txt"

echo "Scan complete. Results saved to $OUTPUT_DIR"
echo "Flag assembly hint: Combine base64 decoded fragments in order"