# FTP Misconfiguration Challenge

## Scenario Description

A company has deployed an FTP server with security misconfigurations. Your task is to identify and exploit these vulnerabilities to retrieve the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.26.193.145 | ftp, ssh |
| attacker | attacker | 172.26.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Identify FTP misconfigurations (anonymous access, weak permissions, etc.)

### Stage 3

Exploit vulnerabilities to gain access

### Stage 4

Retrieve the flag from the compromised system

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
