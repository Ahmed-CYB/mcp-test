# FTP Misconfiguration Challenge

## Scenario Description

A company's FTP server has been misconfigured, allowing unauthorized access to sensitive files. Your task is to identify and exploit the FTP misconfiguration to retrieve the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.195.65 | ftp, ssh |
| attacker | attacker | 172.23.195.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the FTP service

### Stage 2

Analyze FTP configuration and identify misconfigurations

### Stage 3

Exploit FTP vulnerabilities to gain unauthorized access

### Stage 4

Navigate the file system and locate the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
