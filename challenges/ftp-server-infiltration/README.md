# FTP Server Infiltration

## Scenario Description

A company's FTP server contains sensitive files. Your goal is to gain access to the FTP service and retrieve the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.27.193.149 | ftp, ssh |
| attacker | attacker | 172.27.193.3 | terminal |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP service enumeration and vulnerability identification

### Stage 3

Exploit FTP vulnerabilities to gain access

### Stage 4

Navigate FTP directory structure to locate flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
