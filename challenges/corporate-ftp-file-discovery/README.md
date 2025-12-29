# Corporate FTP File Discovery

## Scenario Description

A corporate FTP server contains sensitive files within a realistic directory structure. Players must enumerate the FTP service, navigate the file system, and discover flags hidden in various corporate documents and configuration files.

## Challenge Information

- **Categories:** network, forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.196.107 | ftp, ssh |
| attacker-machine | attacker | 172.23.196.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP enumeration and authentication bypass/credential discovery

### Stage 3

Directory traversal and file system exploration

### Stage 4

File content analysis to locate embedded flags

### Stage 5

Permission exploitation to access restricted directories

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Digital forensics and artifact analysis
