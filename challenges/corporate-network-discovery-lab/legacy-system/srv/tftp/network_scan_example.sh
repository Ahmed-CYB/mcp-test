#!/bin/bash
# Network Discovery Lab - Example Scanning Script
# This script demonstrates various nmap techniques for network enumeration

echo "=== Corporate Network Discovery Lab ==="
echo "Example scanning techniques for legacy-system"
echo ""

# Basic port scan
echo "1. Basic TCP port scan:"
echo "nmap -sS -T4 -p- target_ip"
echo ""

# Service version detection
echo "2. Service version detection:"
echo "nmap -sV -p 21,23,69,80,161 target_ip"
echo ""

# Aggressive scan with scripts
echo "3. Aggressive scan with NSE scripts:"
echo "nmap -A -p 21,23,69,80,161 target_ip"
echo ""

# Specific service enumeration
echo "4. FTP enumeration:"
echo "nmap -p 21 --script=ftp-anon,ftp-bounce,ftp-syst target_ip"
echo ""

echo "5. SNMP enumeration:"
echo "nmap -sU -p 161 --script=snmp-info,snmp-sysdescr target_ip"
echo ""

echo "6. HTTP enumeration:"
echo "nmap -p 80 --script=http-title,http-headers,http-methods target_ip"
echo ""

# Manual service interaction
echo "7. Manual service interaction:"
echo "ftp target_ip (try anonymous login)"
echo "telnet target_ip 23"
echo "snmpwalk -v1 -c public target_ip"
echo ""

echo "8. TFTP file enumeration:"
echo "tftp target_ip"
echo "tftp> get network_scan_example.sh"
echo ""

echo "Remember: Systematic enumeration is key to network discovery!"
echo "Look for configuration files, default credentials, and service banners."