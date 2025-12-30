# Anonymous FTP Access Challenge

## Scenario Description

A misconfigured FTP server allows anonymous access. Participants must discover the service, connect anonymously, and navigate the file system to find the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.203.78 | ftp, ssh |
| attacker | attacker | 172.23.203.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Connect to FTP server using anonymous credentials

### Stage 3

Navigate directory structure and find hidden flag file

### Stage 4

Retrieve and read the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
