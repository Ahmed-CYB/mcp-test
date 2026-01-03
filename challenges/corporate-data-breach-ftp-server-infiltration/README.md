# Corporate Data Breach - FTP Server Infiltration

## Scenario Description

A corporate FTP server contains sensitive employee data and backup files. The server has misconfigured anonymous access and weak authentication mechanisms that allow unauthorized access to restricted directories.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.198.30 | ftp |
| attacker | attacker | 172.23.198.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service on target

### Stage 2

Exploit anonymous FTP access to gather intelligence

### Stage 3

Discover valid credentials in publicly accessible files

### Stage 4

Use credentials to access restricted directories and retrieve the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
