# Memory Forensics Investigation

## Scenario Description

A system has been compromised and a memory dump was captured. Analyze the memory dump using Volatility2 to uncover the hidden flag and understand what happened to the victim system.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.198.3 | ssh, local-filesystem |
| victim-machine | victim | 172.23.198.10 | simulated-processes, malware-artifacts |

## Challenge Stages

### Stage 1

Access the attacker workstation and locate the memory dump file

### Stage 2

Use Volatility2 to analyze the memory dump and identify the operating system profile

### Stage 3

Examine running processes, network connections, and memory artifacts

### Stage 4

Extract the hidden flag from memory structures using appropriate Volatility2 plugins

### Stage 5

Document the forensic findings and attack timeline

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
