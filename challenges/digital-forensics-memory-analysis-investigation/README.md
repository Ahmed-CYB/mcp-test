# Digital Forensics: Memory Analysis Investigation

## Scenario Description

A suspicious workstation has been seized during a cybersecurity incident. As a digital forensic investigator, you must analyze the memory dump to uncover evidence of malicious activity, extract artifacts, and piece together what happened on the compromised system.

## Challenge Information

- **Categories:** forensics
- **Machines:** 2
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| kali-attacker | attacker | 172.28.193.3 | ssh |
| evidence-server | victim | 172.28.193.10 | ftp, http |

## Challenge Stages

### Stage 1

Download and examine the memory dump file from the evidence server

### Stage 2

Use volatility to identify the operating system profile and basic system information

### Stage 3

Extract process lists and identify suspicious running processes

### Stage 4

Analyze network connections and identify potential command & control communications

### Stage 5

Extract files, registry keys, and other artifacts from memory

### Stage 6

Reconstruct the timeline of malicious activity and find hidden evidence

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Digital forensics and artifact analysis
