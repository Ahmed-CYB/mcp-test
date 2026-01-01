# Corporate Data Breach via SMB

## Scenario Description

A corporate file server is running an outdated Samba service with misconfigurations. The attacker must identify vulnerable SMB shares, exploit authentication weaknesses, and extract sensitive corporate data including the final flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.194.48 | samba, ssh |
| attacker-workstation | attacker | 172.23.194.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover SMB service

### Stage 2

Enumerate available SMB shares and permissions

### Stage 3

Exploit null session or weak authentication

### Stage 4

Navigate shared directories to locate sensitive files

### Stage 5

Extract and decrypt the corporate flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
