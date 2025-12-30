# Anonymous FTP Access Challenge

## Scenario Description

A misconfigured FTP server allows anonymous access. Players must discover and exploit this vulnerability to retrieve sensitive information.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.202.33 | ftp, ssh |
| attacker | attacker | 172.23.202.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Test anonymous FTP login credentials

### Stage 3

Navigate FTP directory structure

### Stage 4

Locate and retrieve the flag file

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
