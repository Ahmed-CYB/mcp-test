# Corporate Data Breach Assessment

## Scenario Description

A multinational corporation has hired you to perform a security audit of their file server infrastructure. Intelligence suggests that sensitive project data is stored on an FTP server with questionable security practices. Your mission is to gain unauthorized access and retrieve the classified project flag.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.193.78 | ftp |
| penetration-tester | attacker | 172.23.193.3 | N/A |

## Challenge Stages

### Stage 1

Perform network reconnaissance to identify the FTP service

### Stage 2

Enumerate FTP service for authentication weaknesses

### Stage 3

Gain authenticated access to the file repository

### Stage 4

Locate and decrypt the classified project flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
