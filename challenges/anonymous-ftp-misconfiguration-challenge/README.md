# Anonymous FTP Misconfiguration Challenge

## Scenario Description

A company's FTP server has been misconfigured to allow anonymous access, exposing sensitive files and system information. Exploit this misconfiguration to gain unauthorized access and retrieve the flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.201.18 | ftp, ssh |
| attacker | attacker | 172.23.201.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Exploit anonymous FTP login to access files

### Stage 3

Analyze discovered files for credentials or system information

### Stage 4

Use gathered intelligence for privilege escalation

### Stage 5

Retrieve the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
