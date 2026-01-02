# Banking Security Audit - Legacy FTP Breach

## Scenario Description

A regional bank's legacy FTP server contains critical financial data. As a security consultant, you must demonstrate vulnerabilities in their file transfer system and recover sensitive customer information that could be at risk.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| bank-fileserver | victim | 172.23.198.124 | ftp |
| attacker-workstation | attacker | 172.23.198.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the FTP service

### Stage 2

Exploit FTP authentication weaknesses to gain access

### Stage 3

Navigate directory structure to locate sensitive files

### Stage 4

Extract and decrypt customer database backup using found credentials

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
