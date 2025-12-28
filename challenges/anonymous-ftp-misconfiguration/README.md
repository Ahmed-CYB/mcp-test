# Anonymous FTP Misconfiguration

## Scenario Description

A company's FTP server has been misconfigured to allow anonymous access. Participants must discover and exploit this vulnerability to retrieve sensitive information.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 3

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.193.63 | ftp |
| attacker-machine | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover FTP service

### Stage 2

Attempt anonymous FTP login

### Stage 3

Navigate FTP directory structure to find flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
