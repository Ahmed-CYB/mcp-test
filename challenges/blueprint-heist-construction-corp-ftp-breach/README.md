# Blueprint Heist - Construction Corp FTP Breach

## Scenario Description

A construction company's legacy FTP server contains sensitive project blueprints and employee data. The server has weak authentication and contains encrypted files that hold the final flag.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-ftp | victim | 172.23.205.53 | ftp |
| pentester | attacker | 172.23.205.3 | N/A |

## Challenge Stages

### Stage 1

Discover and enumerate the FTP service on the target machine

### Stage 2

Exploit weak FTP authentication or anonymous access

### Stage 3

Locate encrypted files and credential information

### Stage 4

Decrypt the final flag using discovered credentials

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
