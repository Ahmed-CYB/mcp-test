# Corporate Network Infiltration

## Scenario Description

A corporate network with an exposed FTP server that serves as the entry point to internal systems containing encrypted sensitive data.

## Challenge Information

- **Categories:** network, crypto, forensics
- **Machines:** 3
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.27.193.3 | ssh |
| ftp-server | victim | 172.27.193.10 | ftp, ssh |
| internal-victim | victim | 172.27.193.11 | ssh, http |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP exploitation to gain initial access and gather encryption materials

### Stage 3

Lateral movement to internal victim machine

### Stage 4

Forensic analysis to locate final encrypted flag

### Stage 5

Cryptographic analysis to decrypt the flag using collected materials

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
- Digital forensics and artifact analysis
