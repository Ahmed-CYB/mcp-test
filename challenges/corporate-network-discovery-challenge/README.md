# Corporate Network Discovery Challenge

## Scenario Description

A corporate network has been segmented into multiple servers. Use nmap and network reconnaissance techniques to discover all machines, enumerate their services, and extract flags from each system through proper service interaction.

## Challenge Information

- **Categories:** network
- **Machines:** 4
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.27.193.3 | N/A |
| corporate-gateway | victim | 172.27.193.53 | ssh, ftp, http |
| file-server | victim | 172.27.193.11 | smb, nfs, snmp |
| database-host | victim | 172.27.193.12 | telnet, mysql, dns |

## Challenge Stages

### Stage 1

Perform network discovery to identify all live hosts

### Stage 2

Conduct port scanning to enumerate running services

### Stage 3

Use service-specific tools to interact with discovered services

### Stage 4

Extract flags from each machine through service enumeration

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
