# Corporate Data Breach Investigation

## Scenario Description

A corporate file server running Samba has been reported as potentially compromised. Your task is to demonstrate how an attacker could gain unauthorized access to sensitive corporate documents through SMB brute force attacks and retrieve confidential information.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.197.26 | samba, ssh |
| attacker-workstation | attacker | 172.23.197.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover SMB service

### Stage 2

SMB share enumeration and access attempt

### Stage 3

Brute force attack against SMB authentication

### Stage 4

Access shared files and locate encrypted flag

### Stage 5

Decrypt flag using discovered credentials or keys

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
