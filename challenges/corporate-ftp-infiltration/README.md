# Corporate FTP Infiltration

## Scenario Description

A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to enumerate the FTP service, exploit misconfigurations, and retrieve the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.199.83 | ftp, ssh |
| attacker-machine | attacker | 172.23.199.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the FTP service

### Stage 2

FTP enumeration to identify anonymous access and available directories

### Stage 3

Directory traversal and file discovery to find credentials

### Stage 4

Credential-based authentication to access restricted areas

### Stage 5

Flag extraction from protected directory

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
