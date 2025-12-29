# Corporate FTP Server Penetration

## Scenario Description

A corporate FTP server contains sensitive employee data and confidential files. The server has realistic directory structures, user accounts, and security misconfigurations typical of real-world environments.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.199.103 | ftp, ssh |
| attacker-machine | attacker | 172.23.199.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and service enumeration

### Stage 2

FTP service analysis and authentication bypass

### Stage 3

Directory traversal and file enumeration

### Stage 4

Privilege escalation through configuration files

### Stage 5

Flag extraction from restricted administrative directory

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
