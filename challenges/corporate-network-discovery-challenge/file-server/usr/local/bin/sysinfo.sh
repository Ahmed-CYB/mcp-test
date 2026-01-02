#!/bin/bash
# System Information Script for SNMP
# Returns basic system stats and hidden flag

echo "System: $(hostname)"
echo "Uptime: $(uptime | cut -d, -f1 | cut -d' ' -f4-)"
echo "Users: $(who | wc -l)"
echo "Processes: $(ps aux | wc -l)"
echo "Memory: $(free -h | grep Mem | awk '{print $3"/"$2}')"
echo "Disk: $(df -h / | tail -1 | awk '{print $3"/"$2" ("$5" used)"}')"
echo "Network: $(ip route | grep default | awk '{print $3}')"
echo "Flag: CTF{snmp_extended_oid_discovery_9e3f7b8c}"
echo "Services: SSH(22) SMB(445) NFS(2049) SNMP(161) RDP(3389)"