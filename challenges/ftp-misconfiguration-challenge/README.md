# FTP Misconfiguration Challenge

## Scenario Description

An organization's FTP server has been misconfigured, potentially exposing sensitive data. Your task is to identify the misconfiguration and retrieve the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.23.193.42 | ftp, ssh |
| attacker | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Perform network reconnaissance to discover FTP service

### Stage 2

Identify FTP misconfiguration (anonymous login, weak permissions, etc.)

### Stage 3

Exploit the misconfiguration to access restricted areas

### Stage 4

Locate and retrieve the flag file

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
