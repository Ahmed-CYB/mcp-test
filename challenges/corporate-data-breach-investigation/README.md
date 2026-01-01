# Corporate Data Breach Investigation

## Scenario Description

A financial consulting firm's file server has been reported as potentially compromised. The IT department suspects unauthorized access to their SMB shares. As a security consultant, investigate the server's SMB configuration and recover the sensitive client data flag that may have been accessed by attackers.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.193.180 | samba, ssh |
| attacker-workstation | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Enumerate SMB shares and identify accessible directories

### Stage 2

Extract user credentials or password hashes from accessible files

### Stage 3

Crack obtained credentials using appropriate tools

### Stage 4

Access restricted shares using discovered credentials

### Stage 5

Decrypt the flag file using recovered passwords

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
