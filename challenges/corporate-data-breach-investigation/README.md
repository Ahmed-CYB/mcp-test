# Corporate Data Breach Investigation

## Scenario Description

A corporate file server has been reported as potentially compromised. The server runs Samba services for internal file sharing, but security audits suggest weak configurations. Your task is to investigate the server's SMB implementation and recover sensitive data that may have been exposed.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.193.123 | samba, ssh |
| attacker-workstation | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to identify the target server and running services

### Stage 2

SMB service enumeration to discover available shares and permissions

### Stage 3

Exploit weak SMB configurations to gain unauthorized access

### Stage 4

Navigate shared directories to locate sensitive files and the hidden flag

### Stage 5

Decrypt or decode any protected files using discovered credentials or keys

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
