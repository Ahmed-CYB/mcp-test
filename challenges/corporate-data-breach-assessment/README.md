# Corporate Data Breach Assessment

## Scenario Description

A financial consulting firm has hired you to conduct a security assessment of their file server infrastructure. Intelligence suggests their FTP server may have critical misconfigurations that could expose sensitive client data. Your task is to identify vulnerabilities and retrieve the encrypted client reports to demonstrate the security risk.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.201.61 | ftp |
| security-auditor | attacker | 172.23.201.3 | N/A |

## Challenge Stages

### Stage 1

Discover and enumerate the FTP server services and misconfigurations

### Stage 2

Exploit anonymous access or weak authentication to gain initial access

### Stage 3

Navigate through misconfigured directory permissions to find sensitive files

### Stage 4

Locate configuration files containing encryption keys or credentials

### Stage 5

Decrypt the client financial reports to complete the assessment

### Stage 6

Document the security vulnerabilities for the final report

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
