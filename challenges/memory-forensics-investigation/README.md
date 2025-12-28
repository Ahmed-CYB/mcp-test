# Memory Forensics Investigation

## Scenario Description

A system has been compromised and a memory dump was captured. Use Volatility2 to analyze the memory dump and extract the hidden flag from the compromised system's memory artifacts.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.23.198.3 | ssh, file-server |
| victim-machine | victim | 172.23.198.10 | web, ssh, database |

## Challenge Stages

### Stage 1

Access the attacker machine containing the memory dump file

### Stage 2

Use Volatility2 to identify the memory dump profile and running processes

### Stage 3

Analyze suspicious processes and memory regions for hidden data

### Stage 4

Extract the flag from memory artifacts using appropriate Volatility2 plugins

### Stage 5

Validate the discovered flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
