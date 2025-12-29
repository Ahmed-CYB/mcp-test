# FTP Server Infiltration

## Scenario Description

A simple FTP server challenge where participants must discover and access an FTP service to retrieve the flag

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 3

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.27.193.178 | ftp, ssh |
| attacker | attacker | 172.27.193.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery to find FTP service

### Stage 2

FTP enumeration and access (anonymous or credential-based)

### Stage 3

File exploration and flag retrieval

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
