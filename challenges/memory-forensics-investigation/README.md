# Memory Forensics Investigation

## Scenario Description

A Windows machine was compromised and a memory dump was captured. Use Volatility2 to analyze the memory dump and extract the hidden flag from the compromised system's memory.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-kali | attacker | 172.23.198.3 | ssh, file-server |
| victim-windows | victim | 172.23.198.10 | rdp, smb, http |

## Challenge Stages

### Stage 1

Access the attacker machine containing the memory dump file

### Stage 2

Use Volatility2 to identify the operating system profile

### Stage 3

Analyze running processes and network connections

### Stage 4

Extract suspicious files or data from memory

### Stage 5

Locate and decode the hidden flag within the memory artifacts

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
