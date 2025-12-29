# Corporate FTP Infiltration

## Scenario Description

A corporate FTP server contains sensitive documents. Participants must use network reconnaissance to discover the service, exploit misconfigurations, and retrieve the hidden flag through realistic attack vectors.

## Challenge Information

- **Categories:** network, forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.24.193.87 | ftp, ssh |
| attacker | attacker | 172.24.193.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and port scanning to identify FTP service

### Stage 2

FTP enumeration to discover available directories and files

### Stage 3

Credential discovery through configuration files or brute force

### Stage 4

Directory traversal and privilege escalation within FTP

### Stage 5

Flag extraction from restricted areas

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- forensics
