# Corporate Data Breach - Samba Share Infiltration

## Scenario Description

A corporate file server running Samba has been reported for suspicious activity. As a security analyst, investigate the server's SMB shares to identify potential data exposure vulnerabilities and retrieve sensitive information that may have been compromised.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.29.193.66 | samba, ssh |
| attacker-workstation | attacker | 172.29.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the Samba server and its services

### Stage 2

SMB enumeration to identify available shares and access permissions

### Stage 3

Exploit share misconfigurations or weak authentication to access restricted data

### Stage 4

Navigate the file system to locate and extract the flag containing sensitive corporate information

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
