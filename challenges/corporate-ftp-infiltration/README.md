# Corporate FTP Infiltration

## Scenario Description

A corporate FTP server contains sensitive documents in a realistic file structure. Players must use FTP enumeration and navigation techniques to discover and retrieve hidden flags scattered throughout the directory tree.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.24.193.82 | ftp, ssh |
| attacker | attacker | 172.24.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP connection and authentication (anonymous or credential discovery)

### Stage 3

Directory traversal and file enumeration

### Stage 4

Flag extraction from various realistic file locations

### Stage 5

Advanced FTP techniques for accessing restricted areas

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
