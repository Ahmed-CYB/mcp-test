# Corporate Data Breach Investigation

## Scenario Description

A multinational corporation suspects unauthorized access to their file server. As a security consultant, investigate their SMB infrastructure and demonstrate potential data exposure through misconfigured network shares.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.194.108 | samba, ssh |
| attacker-workstation | attacker | 172.23.194.3 | ssh |

## Challenge Stages

### Stage 1

Network reconnaissance to identify SMB services and available shares

### Stage 2

Enumerate share permissions and accessible directories without authentication

### Stage 3

Discover credentials through exposed configuration files or weak security practices

### Stage 4

Access restricted shares containing sensitive corporate data and retrieve the flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
