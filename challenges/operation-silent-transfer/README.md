# Operation Silent Transfer

## Scenario Description

Intelligence reports indicate a file server containing classified documents is accessible via FTP. The server's security configuration varies unpredictably. Your mission is to identify and exploit the vulnerability to retrieve the encrypted intelligence file.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.195.12 | ftp |
| attacker | attacker | 172.23.195.3 | N/A |

## Challenge Stages

### Stage 1

Reconnaissance: Discover and enumerate the FTP service

### Stage 2

Vulnerability Analysis: Identify the specific security weakness

### Stage 3

Exploitation: Leverage the discovered vulnerability to gain access

### Stage 4

Data Extraction: Locate and decrypt the target intelligence file

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
