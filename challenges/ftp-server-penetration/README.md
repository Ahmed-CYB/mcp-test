# FTP Server Penetration

## Scenario Description

A simple FTP server challenge where participants must discover, access, and extract flags from an FTP service

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 3

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.193.96 | ftp, ssh |
| attacker | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery - scan for open FTP service

### Stage 2

FTP enumeration - identify accessible directories and files

### Stage 3

Flag extraction - retrieve flags from FTP server

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
