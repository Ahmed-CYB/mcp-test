# Corporate Data Breach: Misconfigured File Server

## Scenario Description

A mid-size consulting firm's file server has been misconfigured by a junior system administrator. The server contains sensitive client data, employee information, and administrative credentials. Multiple Samba misconfigurations allow unauthorized access to different levels of sensitive information.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.29.193.116 | smb, ssh |
| attacker-workstation | attacker | 172.29.193.3 | N/A |

## Challenge Stages

### Stage 1

Network discovery and SMB service enumeration

### Stage 2

Exploit anonymous/guest access misconfigurations

### Stage 3

Enumerate accessible shares and extract sensitive data

### Stage 4

Escalate privileges through credential discovery

### Stage 5

Access restricted administrative shares to retrieve the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
