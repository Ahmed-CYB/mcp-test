# Corporate Data Breach Investigation

## Scenario Description

A major corporation suspects their file server has been compromised. As a security consultant, you must demonstrate how an attacker could breach their FTP server and access sensitive project data.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.197.167 | ftp, ssh |
| penetration-tester | attacker | 172.23.197.3 | ssh |

## Challenge Stages

### Stage 1

Reconnaissance - Discover and enumerate FTP service on target server

### Stage 2

Exploitation - Bypass FTP authentication using discovered vulnerability

### Stage 3

Data Extraction - Access and download encrypted corporate files

### Stage 4

Decryption - Crack encryption using credentials hidden in FTP directory structure

### Stage 5

Flag Capture - Decrypt final database backup to retrieve the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
