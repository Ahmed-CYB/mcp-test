# Corporate Data Leak Investigation

## Scenario Description

A corporate whistleblower has leaked sensitive documents through an internal FTP server. Intelligence suggests the files are encrypted and the server has a security flaw, but the exact vulnerability is unknown. Your mission is to infiltrate the FTP server and recover the classified information.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.199.68 | ftp |
| attacker | attacker | 172.23.199.3 | N/A |

## Challenge Stages

### Stage 1

Discover and scan the FTP server for vulnerabilities

### Stage 2

Exploit the random security flaw to gain access

### Stage 3

Navigate through decoy files to find the encrypted flag

### Stage 4

Locate the decryption key hidden in server configuration

### Stage 5

Decrypt and retrieve the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
