# Memory Forensics Investigation

## Scenario Description

A corporate workstation was suspected of being compromised. A memory dump was captured and needs to be analyzed to find evidence of the attack and recover the hidden flag.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.23.198.3 | ssh, file-server |
| victim-workstation | victim | 172.23.198.10 | rdp, smb |

## Challenge Stages

### Stage 1

Access the attacker machine and locate the memory dump file

### Stage 2

Use volatility2 to analyze the memory dump structure and identify the operating system profile

### Stage 3

Extract running processes, network connections, and loaded modules from the dump

### Stage 4

Analyze suspicious processes and memory artifacts to locate the hidden flag

### Stage 5

Validate findings against the victim machine's expected behavior

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
