#!/bin/bash
# Network discovery script for corporate-gateway challenge

echo "Starting comprehensive network scan..."
echo "Target: corporate-gateway (assume IP: 192.168.100.10)"

# Initial host discovery
nmap -sn 192.168.100.0/24
nmap -sn 10.10.1.0/24  
nmap -sn 172.16.50.0/24

# Service enumeration on gateway
nmap -sS -sV -O 192.168.100.10

# Specific port scans
nmap -p 20-21,22,80,443,2222,8080 192.168.100.10

# FTP anonymous access test
ftp 192.168.100.10 20
# Use: anonymous / anonymous@example.com
# Commands: ls, cd documents, get flag1.txt, get network_topology.txt

# SSH with discovered credentials
ssh maintenance@192.168.100.10 -p 2222
# Password: temp123

# Web enumeration
curl http://192.168.100.10:8080/
curl http://192.168.100.10:8080/logs/
curl http://192.168.100.10:8080/status.php

echo "Scan complete - check all discovered services and files"