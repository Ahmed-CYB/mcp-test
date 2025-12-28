# Memory Forensics Investigation

## Scenario Description

A company's workstation was compromised and a memory dump was captured during the incident. As a digital forensics investigator, you must analyze the memory dump using volatility2 to uncover the hidden flag and understand what happened during the attack.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.198.3 | ssh |
| compromised-victim | victim | 172.23.198.10 | web, ssh |

## Challenge Stages

### Stage 1

Access the attacker workstation containing the memory dump file

### Stage 2

Use volatility2 to identify the operating system and memory profile

### Stage 3

Analyze running processes and network connections in the memory dump

### Stage 4

Extract suspicious files, registry entries, or command history from memory

### Stage 5

Locate and extract the flag hidden within the memory artifacts

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
