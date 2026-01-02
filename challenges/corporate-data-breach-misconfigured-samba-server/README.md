# Corporate Data Breach: Misconfigured Samba Server

## Scenario Description

A mid-size consulting firm's file server has been misconfigured, allowing unauthorized access to sensitive corporate data. As a penetration tester, you've been hired to assess the security of their network infrastructure and retrieve confidential information to demonstrate the vulnerability.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.193.94 | smb, ssh |
| penetration-tester | attacker | 172.23.193.3 | N/A |

## Challenge Stages

### Stage 1

Discover and enumerate the target SMB service

### Stage 2

Identify misconfigured shares and weak authentication

### Stage 3

Access sensitive directories and extract corporate data

### Stage 4

Locate and retrieve the flag from the compromised file system

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
