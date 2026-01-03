# Digital Media Archive Breach

## Scenario Description

A digital media company's archive server contains sensitive project files. The FTP server has been misconfigured, allowing anonymous access to certain directories. However, the most valuable files are encrypted using a custom cipher.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.27.193.34 | ftp |
| attacker | attacker | 172.27.193.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Exploit anonymous FTP access to browse directories

### Stage 3

Locate and download encrypted flag file

### Stage 4

Find cipher key or decryption method in configuration files

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
