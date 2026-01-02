# Corporate Network Reconnaissance

## Scenario Description

You are a penetration tester hired to assess a small corporate network. Use nmap and other reconnaissance tools to discover all services, enumerate system information, and locate security flags hidden within the network infrastructure.

## Challenge Information

- **Categories:** network
- **Machines:** 3
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.201.3 | nmap, wireshark, tcpdump, netcat, hping3, masscan, ssh-client, smbclient, snmp, python3, curl, wget |
| corporate-server | victim | 172.23.201.135 | ssh, ftp, http, telnet, snmp, mysql |
| backup-nas | victim | 172.23.201.11 | smb, nfs, ssh, tftp |

## Challenge Stages

### Stage 1

Perform initial network discovery to identify active hosts

### Stage 2

Conduct comprehensive port scanning on discovered targets

### Stage 3

Use service enumeration to gather detailed information about running services

### Stage 4

Analyze service banners and SNMP data to locate hidden information

### Stage 5

Access file shares and services to retrieve final flags

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
