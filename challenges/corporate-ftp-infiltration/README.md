# Corporate FTP Infiltration

## Scenario Description

A corporate FTP server contains sensitive files with realistic directory structures. Players must enumerate the service, discover access methods, and extract hidden information from various file types.

## Challenge Information

- **Categories:** network, forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.24.193.166 | ftp, ssh |
| attacker-machine | attacker | 172.24.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP enumeration and access testing (anonymous/authenticated)

### Stage 3

Directory traversal and file discovery

### Stage 4

File download and local analysis

### Stage 5

Flag extraction from various file types and locations

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Digital forensics and artifact analysis
