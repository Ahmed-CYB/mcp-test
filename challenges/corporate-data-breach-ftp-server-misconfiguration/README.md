# Corporate Data Breach: FTP Server Misconfiguration

## Scenario Description

A financial consulting firm's FTP server has been misconfigured by a junior administrator, leaving sensitive client data exposed. As a security consultant, you must identify and exploit these misconfigurations to demonstrate the security risks.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.25.193.12 | ftp |
| security-auditor | attacker | 172.25.193.3 | N/A |

## Challenge Stages

### Stage 1

Discover the FTP service running on the corporate network

### Stage 2

Identify authentication bypass vulnerabilities and directory traversal issues

### Stage 3

Navigate through misconfigured directory permissions to access restricted areas

### Stage 4

Locate and retrieve the flag from encrypted financial documents

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
