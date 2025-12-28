# Memory Forensics Investigation

## Scenario Description

You are a digital forensics investigator who has been provided with a memory dump from a compromised system. Use your forensics workstation equipped with Volatility tools to analyze the memory dump and uncover hidden evidence, malicious processes, network connections, and extract critical information to solve the case.

## Challenge Information

- **Categories:** forensics
- **Machines:** 1
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| forensics-workstation | attacker | 172.23.198.3 | ssh, desktop-environment |

## Challenge Stages

### Stage 1

Initial memory dump analysis - identify OS profile and basic system info

### Stage 2

Process analysis - discover running processes and suspicious activities

### Stage 3

Network forensics - extract network connections and communications

### Stage 4

File system artifacts - recover deleted or hidden files from memory

### Stage 5

Advanced analysis - decrypt or decode obfuscated data to find final flags

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
