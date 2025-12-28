# FTP Server Challenge

## Scenario Description

A simple FTP server challenge where participants must discover, connect to, and extract files from an FTP service to find the flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.24.193.135 | ftp, ssh |
| attacker | attacker | 172.24.193.3 | terminal |

## Challenge Stages

### Stage 1

Network discovery to find the FTP server

### Stage 2

FTP service enumeration and reconnaissance

### Stage 3

Authentication bypass or credential discovery

### Stage 4

File retrieval and flag extraction

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
