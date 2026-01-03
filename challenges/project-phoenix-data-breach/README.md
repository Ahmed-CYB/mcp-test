# Project Phoenix Data Breach

## Scenario Description

TechCorp's internal FTP server contains sensitive Project Phoenix documentation. As a security consultant, you must assess the server's security posture and retrieve the classified project flag.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.207.129 | ftp |
| penetration-tester | attacker | 172.23.207.3 | N/A |

## Challenge Stages

### Stage 1

Network discovery to locate the FTP service

### Stage 2

FTP enumeration and access attempt

### Stage 3

File retrieval and analysis

### Stage 4

Cryptographic analysis of the encrypted flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
