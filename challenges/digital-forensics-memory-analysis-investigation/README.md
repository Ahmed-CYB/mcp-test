# Digital Forensics: Memory Analysis Investigation

## Scenario Description

A security incident has occurred and you've been provided with a memory dump from the compromised system. Use volatility to analyze the memory dump and uncover evidence of the attack.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.28.193.3 | ssh, volatility3, forensics-tools |
| evidence-server | victim | 172.28.193.10 | ftp, http |

## Challenge Stages

### Stage 1

Access the evidence server and download the memory dump

### Stage 2

Identify the correct memory profile using volatility

### Stage 3

Extract process information and identify suspicious processes

### Stage 4

Analyze network connections and recover network artifacts

### Stage 5

Extract files and strings from memory to find hidden data

### Stage 6

Reconstruct the attack timeline and find all flags

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
