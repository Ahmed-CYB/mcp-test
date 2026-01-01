# Corporate Data Leak Investigation

## Scenario Description

A corporate whistleblower claims sensitive financial data is being stored insecurely on the company's FTP server. Your task is to investigate the FTP infrastructure and recover the encrypted evidence file.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.195.130 | ftp, ssh |
| attacker | attacker | 172.23.195.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Exploit anonymous FTP access to explore directory structure

### Stage 3

Discover backup configuration files containing user credentials

### Stage 4

Use credentials to access restricted directories

### Stage 5

Locate and decrypt the evidence file containing the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
