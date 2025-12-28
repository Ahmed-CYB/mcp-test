# FTP Misconfiguration Challenge

## Scenario Description

A company has deployed an FTP server with poor security configurations. Your task is to identify and exploit these misconfigurations to retrieve the hidden flag.

## Challenge Information

- **Categories:** network
- **Machines:** 2
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| ftp-server | victim | 172.26.193.10 | ftp, ssh |
| attacker | attacker | 172.26.193.3 | ssh |

## Challenge Stages

### Stage 1

Reconnaissance: Scan and identify the FTP service

### Stage 2

Vulnerability Analysis: Discover FTP misconfigurations (anonymous access, weak credentials, directory traversal, etc.)

### Stage 3

Exploitation: Exploit the identified misconfigurations to access restricted areas

### Stage 4

Flag Retrieval: Locate and extract the flag from the compromised FTP server

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
