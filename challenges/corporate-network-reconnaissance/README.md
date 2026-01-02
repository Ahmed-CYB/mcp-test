# Corporate Network Reconnaissance

## Scenario Description

You've gained access to a corporate network and need to map out the infrastructure. Use nmap and other tools to discover all running services across three target machines, each hosting different protocols and containing pieces of network intelligence.

## Challenge Information

- **Categories:** network, web
- **Machines:** 4
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.206.3 | N/A |
| corporate-web-server | victim | 172.23.206.178 | http, https, ssh |
| file-storage-server | victim | 172.23.206.11 | ftp, smb, nfs, ssh |
| legacy-terminal-server | victim | 172.23.206.12 | telnet, snmp, ssh |

## Challenge Stages

### Stage 1

Perform initial network discovery to identify all live hosts

### Stage 2

Conduct comprehensive port scanning on each discovered machine

### Stage 3

Enumerate services and gather network topology information

### Stage 4

Access file shares and web interfaces to collect network diagrams

### Stage 5

Use SNMP to gather detailed network device information

### Stage 6

Combine all discovered intelligence to locate the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Web application vulnerability exploitation
