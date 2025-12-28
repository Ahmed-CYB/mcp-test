# FTP Misconfiguration Challenge

## Scenario Description

A company has deployed an FTP server for file sharing but has made several configuration mistakes. Exploit these misconfigurations to gain unauthorized access and retrieve sensitive information.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.193.69 | ftp, ssh |
| attacker | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the FTP service

### Stage 2

Identify FTP misconfigurations (anonymous access, weak credentials, directory traversal)

### Stage 3

Exploit misconfigurations to access restricted files

### Stage 4

Retrieve the flag from the compromised FTP server

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
