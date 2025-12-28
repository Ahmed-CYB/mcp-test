# Corporate Breach Investigation

## Scenario Description

A corporate workstation was compromised during a security incident. As a digital forensics investigator, you must analyze the memory dump to uncover what the attacker did, what data was accessed, and find evidence of the breach.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.198.3 | ssh |
| evidence-server | victim | 172.23.198.10 | ftp, http |

## Challenge Stages

### Stage 1

Access the evidence server and retrieve the memory dump file

### Stage 2

Use volatility to identify the operating system and memory profile

### Stage 3

Analyze running processes and network connections at time of capture

### Stage 4

Extract suspicious files and artifacts from memory

### Stage 5

Investigate user activity and accessed documents

### Stage 6

Uncover the attacker's persistence mechanisms and stolen data

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
