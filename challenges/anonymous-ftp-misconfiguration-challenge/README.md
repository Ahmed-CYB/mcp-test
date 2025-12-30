# Anonymous FTP Misconfiguration Challenge

## Scenario Description

A corporate FTP server has been misconfigured to allow anonymous access, exposing sensitive company data. Players must discover and exploit this misconfiguration to retrieve the flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.200.85 | ftp, ssh |
| attacker-machine | attacker | 172.23.200.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Exploit anonymous FTP access to browse server contents

### Stage 3

Analyze downloaded files for sensitive information

### Stage 4

Locate and retrieve the flag from accessible directories

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
