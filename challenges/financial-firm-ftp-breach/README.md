# Financial Firm FTP Breach

## Scenario Description

A financial consulting firm hired you to test their file server security. Their FTP server contains sensitive client financial data, but the system administrator made several critical misconfigurations that could expose confidential information. Your goal is to identify these vulnerabilities and retrieve the encrypted flag representing the most sensitive data.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.199.36 | ftp |
| pentester-workstation | attacker | 172.23.199.3 | N/A |

## Challenge Stages

### Stage 1

Reconnaissance: Scan the network to discover the FTP service and identify misconfigurations

### Stage 2

Exploitation: Access the FTP server using discovered credentials or anonymous access

### Stage 3

Data Extraction: Navigate the file system to locate sensitive files and configuration data

### Stage 4

Cryptographic Challenge: Decrypt the flag using information gathered from the compromised server

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
