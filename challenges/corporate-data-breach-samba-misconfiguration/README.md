# Corporate Data Breach - Samba Misconfiguration

## Scenario Description

A mid-sized accounting firm's file server has been misconfigured, exposing sensitive corporate data through poorly secured Samba shares. As a penetration tester, identify the misconfigurations and extract confidential information.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.204.123 | smb, ssh |
| attacker-workstation | attacker | 172.23.204.3 | N/A |

## Challenge Stages

### Stage 1

Network reconnaissance to identify the Samba server and available shares

### Stage 2

Enumerate share permissions and identify publicly accessible directories

### Stage 3

Exploit weak authentication mechanisms to access restricted content

### Stage 4

Extract sensitive corporate data and locate the hidden flag file

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
