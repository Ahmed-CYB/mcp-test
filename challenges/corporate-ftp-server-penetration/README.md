# Corporate FTP Server Penetration

## Scenario Description

A corporate FTP server contains sensitive files across various directory paths. Players must use network reconnaissance and FTP enumeration techniques to discover and retrieve multiple flags hidden throughout the filesystem.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.198.141 | ftp, ssh |
| attacker-kali | attacker | 172.23.198.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and port scanning to identify FTP service

### Stage 2

FTP service enumeration and authentication bypass attempts

### Stage 3

Directory traversal and file discovery across multiple paths

### Stage 4

Flag extraction from various locations using different FTP techniques

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
