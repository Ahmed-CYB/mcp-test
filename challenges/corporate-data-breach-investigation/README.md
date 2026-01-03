# Corporate Data Breach Investigation

## Scenario Description

A biotechnology company suspects unauthorized access to their research data server. The FTP server contains sensitive research files that may have been compromised. Your task is to investigate the FTP service and recover the confidential flag that proves data exfiltration occurred.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.205.114 | ftp |
| attacker | attacker | 172.23.205.3 | N/A |

## Challenge Stages

### Stage 1

Perform network reconnaissance to identify the FTP server

### Stage 2

Analyze FTP service configuration and available access methods

### Stage 3

Navigate the FTP directory structure to locate sensitive files

### Stage 4

Decrypt or decode protected files to extract the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
