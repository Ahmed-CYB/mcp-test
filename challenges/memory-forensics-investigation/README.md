# Memory Forensics Investigation

## Scenario Description

A system has been compromised and you've obtained a memory dump. Use Volatility2 to analyze the dump and uncover the hidden flag within the system's memory structures.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.23.198.3 | ssh, file-transfer |
| victim-machine | victim | 172.23.198.10 | web, ssh, background-processes |

## Challenge Stages

### Stage 1

Access the attacker machine and locate the memory dump file

### Stage 2

Use Volatility2 to identify the operating system profile

### Stage 3

Analyze running processes to find suspicious activity

### Stage 4

Extract memory artifacts (network connections, files, registry keys)

### Stage 5

Locate and decode the flag hidden in memory structures

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
