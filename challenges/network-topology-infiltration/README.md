# Network Topology Infiltration

## Scenario Description

Navigate complex network segmentation using precise network scanning and reconnaissance techniques

## Challenge Information

- **Categories:** network
- **Machines:** 4
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-machine | attacker | 172.23.206.3 | N/A |
| hidden-network-alpha | victim | 172.23.206.114 | ssh, ftp, snmp |
| restricted-subnet-beta | victim | 172.23.206.11 | telnet, http |
| monitoring-gateway | victim | 172.23.206.12 | ssh, nfs |

## Challenge Stages

### Stage 1

Discover hidden network topology

### Stage 2

Bypass network segmentation restrictions

### Stage 3

Collect distributed flag components

### Stage 4

Reconstruct complete flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
