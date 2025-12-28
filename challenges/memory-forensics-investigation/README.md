# Memory Forensics Investigation

## Scenario Description

A corporate system has been compromised and a memory dump was captured during the incident. As a digital forensics investigator, you must analyze the memory dump using Volatility2 to uncover evidence of the attack and retrieve the hidden flag.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.23.199.3 | ssh, file-server |
| victim-machine | victim | 172.23.199.10 | web-server, database, background-processes |

## Challenge Stages

### Stage 1

Access the attacker machine and locate the memory dump file

### Stage 2

Use Volatility2 to identify the operating system profile

### Stage 3

Analyze running processes to identify suspicious activity

### Stage 4

Extract network connections and artifacts from memory

### Stage 5

Locate and decode the hidden flag within memory structures

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
