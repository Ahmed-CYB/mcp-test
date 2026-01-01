# Project Archive Infiltration

## Scenario Description

A software development company uses an FTP server to store archived project files and system backups. Recent security audits revealed potential vulnerabilities in their file sharing infrastructure. Your mission is to penetrate their FTP server and locate sensitive corporate data that shouldn't be publicly accessible.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.196.88 | ftp, ssh |
| attacker | attacker | 172.23.196.3 | tools |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the FTP service

### Stage 2

Analyze FTP server configuration and access controls

### Stage 3

Navigate directory structure to find hidden or restricted files

### Stage 4

Extract the corporate flag from archived sensitive documents

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
