# Corporate Data Breach Assessment

## Scenario Description

A mid-sized consulting firm has hired you to assess their file server security after a recent security audit raised concerns about data exposure. The company's main file server runs Samba with multiple shares for different departments. Your task is to identify misconfigurations and demonstrate potential data exposure risks.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.205.106 | smb, ssh |
| penetration-tester | attacker | 172.23.205.3 | N/A |

## Challenge Stages

### Stage 1

Discover and enumerate available SMB shares on the corporate file server

### Stage 2

Identify misconfigured shares with improper access controls

### Stage 3

Extract sensitive information from accessible shares

### Stage 4

Use discovered credentials to access restricted administrative shares

### Stage 5

Locate and retrieve the final flag from the most sensitive data repository

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
