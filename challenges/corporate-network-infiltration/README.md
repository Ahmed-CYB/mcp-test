# Corporate Network Infiltration

## Scenario Description

A mid-sized technology company has deployed legacy file sharing services with critical misconfigurations. Security audit reveals that both FTP and SMB services contain vulnerabilities that could lead to complete data compromise.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 3
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.27.193.36 | ftp, ssh |
| backup-storage | victim | 172.27.193.11 | smb, netbios, ssh |
| attacker-workstation | attacker | 172.27.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover active services and ports

### Stage 2

Exploit FTP anonymous access to gather intelligence and credentials

### Stage 3

Leverage discovered credentials to access misconfigured SMB shares

### Stage 4

Decrypt final flag using information gathered from both services

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
