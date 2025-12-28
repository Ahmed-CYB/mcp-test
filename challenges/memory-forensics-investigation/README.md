# Memory Forensics Investigation

## Scenario Description

A security incident has occurred and you have obtained a memory dump from the compromised system. Use volatility2 to analyze the memory dump and extract the hidden flag.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.23.198.3 | ssh, file-server |
| victim-machine | victim | 172.23.198.10 | web-server, database |

## Challenge Stages

### Stage 1

Access the attacker machine and locate the memory dump file

### Stage 2

Use volatility2 to identify the operating system profile

### Stage 3

Analyze running processes and network connections

### Stage 4

Extract suspicious files or data from memory

### Stage 5

Locate and retrieve the hidden flag using various volatility2 plugins

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
