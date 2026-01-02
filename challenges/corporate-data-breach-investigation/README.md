# Corporate Data Breach Investigation

## Scenario Description

A financial consulting firm suspects their FTP server has been compromised. As a security analyst, you must demonstrate how an attacker could gain unauthorized access to their file server containing sensitive client data.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 3

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.206.190 | ftp |
| attacker | attacker | 172.23.206.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to identify FTP service

### Stage 2

Brute force attack against FTP authentication

### Stage 3

Access and retrieve confidential flag from server

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
