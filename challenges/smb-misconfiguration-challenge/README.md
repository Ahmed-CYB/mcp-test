# SMB Misconfiguration Challenge

## Scenario Description

A file server running SMB has been misconfigured, creating a security vulnerability. Your task is to discover the misconfiguration and retrieve the flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| smb-server | victim | 172.23.200.22 | smb, netbios |
| attacker | attacker | 172.23.200.3 | ssh |

## Challenge Stages

### Stage 1

Network discovery and port scanning

### Stage 2

SMB service enumeration

### Stage 3

Identify the random misconfiguration vulnerability

### Stage 4

Exploit the misconfiguration to gain access

### Stage 5

Retrieve the flag from the SMB shares

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
