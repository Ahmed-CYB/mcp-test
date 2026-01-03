# Corporate Data Breach Investigation

## Scenario Description

A corporate network has been compromised and sensitive files are being exfiltrated via FTP. Your mission is to infiltrate the FTP server, recover the stolen data, and decrypt the flag containing critical security information.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.206.147 | ftp |
| attacker | attacker | 172.23.206.3 | N/A |

## Challenge Stages

### Stage 1

Perform network reconnaissance to identify active FTP service

### Stage 2

Exploit FTP server vulnerabilities or weak credentials to gain access

### Stage 3

Navigate FTP directory structure to locate encrypted flag file

### Stage 4

Find decryption key or cipher information within server files

### Stage 5

Decrypt the flag to complete the challenge

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
