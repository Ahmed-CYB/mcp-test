# DataCorp File Server Audit

## Scenario Description

A mid-sized technology company has hired you to audit their file server security. Intelligence suggests their FTP server may have configuration vulnerabilities that could expose sensitive corporate data. Your task is to identify and exploit these misconfigurations to demonstrate the security risk.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.29.193.129 | ftp |
| security-auditor | attacker | 172.29.193.3 | N/A |

## Challenge Stages

### Stage 1

Perform network reconnaissance to identify the FTP service and its configuration

### Stage 2

Exploit FTP misconfigurations to gain unauthorized access to the file system

### Stage 3

Navigate through corporate directories to locate sensitive documents

### Stage 4

Extract and decrypt the final flag from protected company archives

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
