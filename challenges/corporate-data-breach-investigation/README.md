# Corporate Data Breach Investigation

## Scenario Description

A corporate whistleblower has leaked information about sensitive files stored on an internal FTP server. Intelligence suggests the server allows anonymous access and contains encrypted evidence of corporate misconduct. Your mission is to infiltrate the FTP server and recover the hidden evidence.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.197.26 | ftp |
| attacker-workstation | attacker | 172.23.197.3 | N/A |

## Challenge Stages

### Stage 1

Discover and enumerate the FTP server services

### Stage 2

Exploit anonymous FTP access to browse file structure

### Stage 3

Navigate hidden directory paths to locate sensitive files

### Stage 4

Extract and decrypt the evidence file to reveal the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
