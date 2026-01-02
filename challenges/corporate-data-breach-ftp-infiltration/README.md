# Corporate Data Breach - FTP Infiltration

## Scenario Description

A financial services company has an exposed FTP server containing sensitive client data. The server uses weak password policies, making it vulnerable to brute force attacks. Intelligence suggests the flag is encrypted within the corporate file repository.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.29.193.107 | ftp |
| attacker-kali | attacker | 172.29.193.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Brute force attack against FTP authentication using provided wordlists

### Stage 3

File enumeration and extraction from compromised FTP server

### Stage 4

Decrypt the obtained flag file to complete the challenge

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
