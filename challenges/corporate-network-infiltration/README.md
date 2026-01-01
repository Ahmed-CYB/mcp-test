# Corporate Network Infiltration

## Scenario Description

A security audit of DataFlow Industries reveals critical misconfigurations in their file sharing infrastructure. The corporate file server runs an FTP service with dangerous anonymous access, while the HR department's Samba server allows null session enumeration. Each system contains pieces of sensitive information that must be combined to complete the assessment.

## Challenge Information

- **Categories:** network
- **Machines:** 3
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.27.193.36 | ftp, ssh |
| hr-department | victim | 172.27.193.11 | smb, netbios, ssh |
| attacker-workstation | attacker | 172.27.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover active services and open ports

### Stage 2

Exploit FTP anonymous access to retrieve network documentation and configuration files

### Stage 3

Use discovered information to identify and exploit SMB null session vulnerability

### Stage 4

Extract and combine data from both systems to reconstruct the final assessment report

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
