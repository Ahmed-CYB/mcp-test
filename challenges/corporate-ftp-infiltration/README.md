# Corporate FTP Infiltration

## Scenario Description

A corporate FTP server contains sensitive files in a realistic directory structure. Players must use network reconnaissance to discover and exploit FTP vulnerabilities to access hidden files and directories.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.24.193.109 | ftp, ssh |
| attacker | attacker | 172.24.193.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and port scanning to identify FTP service

### Stage 2

FTP enumeration and authentication bypass attempts

### Stage 3

Directory traversal and file system exploration

### Stage 4

Extraction of sensitive files and flag discovery

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
