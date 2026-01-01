#!/bin/bash
# Example nmap scanning commands for this challenge

echo "=== Corporate Network Reconnaissance Challenge ==="
echo "Target: corporate-fileserver"
echo

echo "Step 1: Initial port discovery"
echo "nmap -sS -O corporate-fileserver"
echo

echo "Step 2: Service enumeration on discovered ports"
echo "nmap -sV -sC -p 26,2022,139,445,2049,161 corporate-fileserver"
echo

echo "Step 3: FTP enumeration (custom port)"
echo "nmap -sV --script ftp-* -p 26 corporate-fileserver"
echo

echo "Step 4: Anonymous FTP access test"
echo "ftp corporate-fileserver 26"
echo "Username: anonymous"
echo "Password: [blank]"
echo

echo "Step 5: Directory enumeration"
echo "ls -la"
echo "cd backup"
echo "get backup_config.conf"
echo

echo "Remember: Look for flags in configuration files!"