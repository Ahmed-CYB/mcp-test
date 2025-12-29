# Corporate FTP Infiltration

## Scenario Description

A corporate FTP server contains sensitive files within a realistic directory structure. Players must use network reconnaissance and FTP enumeration techniques to navigate the file system and locate the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.197.198 | ftp, ssh |
| attacker-machine | attacker | 172.23.197.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and port scanning to identify FTP service

### Stage 2

FTP service enumeration and authentication bypass/brute force

### Stage 3

Directory traversal and file system exploration

### Stage 4

Analysis of discovered files for credentials or sensitive information

### Stage 5

Flag location and retrieval from protected directory

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
