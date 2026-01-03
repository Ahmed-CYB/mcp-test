# Corporate Data Breach Investigation

## Scenario Description

A corporate FTP server has been identified during network reconnaissance. The server appears to contain sensitive employee data and system backups. Your mission is to gain unauthorized access and extract the hidden flag from the administrative files.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.205.61 | ftp |
| attacker-workstation | attacker | 172.23.205.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to identify FTP service and configuration

### Stage 2

Exploit anonymous FTP access to gather intelligence on user accounts

### Stage 3

Perform credential attacks against discovered user accounts

### Stage 4

Navigate directory structure to locate encrypted backup files

### Stage 5

Decrypt backup files to reveal administrative access credentials

### Stage 6

Access restricted administrative directory to capture the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
