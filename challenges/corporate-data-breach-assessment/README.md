# Corporate Data Breach Assessment

## Scenario Description

A mid-sized technology company has hired you to assess their file server security. Intelligence suggests that sensitive employee data may be accessible through their legacy FTP infrastructure. Your mission is to identify vulnerabilities and retrieve the confidential flag from their corporate file server.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.197.67 | ftp |
| penetration-tester | attacker | 172.23.197.3 | N/A |

## Challenge Stages

### Stage 1

Perform network reconnaissance to identify active FTP services

### Stage 2

Analyze FTP service configuration and authentication mechanisms

### Stage 3

Exploit identified vulnerabilities to gain unauthorized access

### Stage 4

Navigate the file system to locate and retrieve the hidden corporate flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
