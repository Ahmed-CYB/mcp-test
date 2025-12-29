# Corporate FTP Breach

## Scenario Description

A corporate file server has been hastily configured with FTP access for remote workers. The system administrator made several configuration mistakes that expose sensitive company data and system files.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.29.193.125 | ftp, ssh |
| attacker | attacker | 172.29.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the FTP service

### Stage 2

Exploit anonymous FTP access to browse server directories

### Stage 3

Identify misconfigured permissions and writable directories

### Stage 4

Navigate real filesystem paths to locate sensitive files

### Stage 5

Extract flag from accessible system location

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
