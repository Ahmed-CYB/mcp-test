# Corporate Data Breach - FTP Server Infiltration

## Scenario Description

A corporate FTP server contains sensitive documents and an encrypted flag. The server has weak security configurations that allow unauthorized access through various FTP exploitation techniques.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.198.14 | ftp |
| attacker-workstation | attacker | 172.23.198.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP service enumeration and vulnerability assessment

### Stage 3

Exploit weak FTP authentication mechanisms

### Stage 4

Navigate FTP directory structure to locate sensitive files

### Stage 5

Extract and decrypt the encrypted flag file

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
