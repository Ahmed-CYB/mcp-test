# Memory Forensics Investigation

## Scenario Description

A system has been compromised and a memory dump was captured during the incident. Analyze the memory dump using Volatility2 to uncover the hidden flag and understand what happened during the attack.

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

Access the attacker machine containing the memory dump file

### Stage 2

Use Volatility2 to identify the memory dump profile and basic system information

### Stage 3

Analyze running processes and network connections at time of capture

### Stage 4

Extract suspicious artifacts, strings, or hidden data containing the flag

### Stage 5

Correlate findings to reconstruct the attack timeline

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
