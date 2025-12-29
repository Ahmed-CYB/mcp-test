# FTP Server Challenge

## Scenario Description

A simple FTP server challenge where participants must discover, access, and retrieve sensitive information from an FTP service

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.193.165 | ftp, ssh |
| attacker | attacker | 172.23.193.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP service enumeration and analysis

### Stage 3

Gain access to FTP server (anonymous login, brute force, or exploit)

### Stage 4

Navigate FTP directories and locate flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
