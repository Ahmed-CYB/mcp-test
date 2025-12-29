# FTP Directory Navigation Challenge

## Scenario Description

A realistic FTP server challenge focusing on directory traversal, file discovery, and FTP protocol exploitation. Players must navigate complex directory structures to find hidden flags.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.197.134 | ftp, ssh |
| attacker | attacker | 172.23.197.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

FTP service enumeration and authentication bypass/brute force

### Stage 3

Directory traversal and file system exploration

### Stage 4

Advanced FTP commands to access restricted paths

### Stage 5

Flag collection from multiple directory locations

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
