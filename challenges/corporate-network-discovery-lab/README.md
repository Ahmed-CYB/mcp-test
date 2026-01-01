# Corporate Network Discovery Lab

## Scenario Description

A practice environment for mastering nmap scanning techniques across a simulated corporate network with diverse systems and services

## Challenge Information

- **Categories:** network
- **Machines:** 4
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| scanner-workstation | attacker | 172.23.193.3 | nmap, wireshark, tcpdump, netcat, hping3, masscan, nc, net-tools, iputils-ping, python3, curl, wget, git, vim, nano, bash, ssh-client, smbclient, nfs-common, snmp, tftp |
| corporate-fileserver | victim | 172.23.193.18 | ftp, ssh, smb, nfs, snmp |
| legacy-system | victim | 172.23.193.11 | telnet, ftp, http, snmp, tftp |
| database-server | victim | 172.23.193.12 | mysql, postgresql, redis, ssh, http |

## Challenge Stages

### Stage 1

Basic host discovery and ping sweeps

### Stage 2

Port scanning and service identification

### Stage 3

OS fingerprinting and version detection

### Stage 4

Advanced nmap scripting and vulnerability scanning

### Stage 5

Service enumeration and banner grabbing

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
