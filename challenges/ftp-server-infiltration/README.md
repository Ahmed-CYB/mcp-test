# FTP Server Infiltration

## Scenario Description

A company runs an FTP server for file sharing. Your task is to discover, enumerate, and extract sensitive information from the FTP service.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 3

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.198.71 | ftp, ssh |
| attacker | attacker | 172.23.198.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and port scanning to locate FTP service

### Stage 2

FTP service enumeration and authentication bypass/brute force

### Stage 3

File system exploration and flag extraction

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
