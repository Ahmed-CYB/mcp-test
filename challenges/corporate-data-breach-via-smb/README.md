# Corporate Data Breach via SMB

## Scenario Description

A corporate file server running Samba has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to identify the vulnerability, gain access to the shared resources, and retrieve the confidential flag file.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| samba-fileserver | victim | 172.23.193.152 | samba, ssh |
| attacker-workstation | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to discover the Samba service

### Stage 2

SMB enumeration to identify accessible shares and permissions

### Stage 3

Exploit misconfigured shares or weak authentication to access restricted files

### Stage 4

Locate and retrieve the encrypted flag from the file server

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
