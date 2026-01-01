# Corporate Network Reconnaissance Lab

## Scenario Description

A simulated corporate network environment designed for comprehensive nmap training. Practice various scanning techniques across different operating systems and services to master network discovery and enumeration.

## Challenge Information

- **Categories:** network
- **Machines:** 5
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| scanner-workstation | attacker | 172.23.193.3 | ssh |
| linux-server | victim | 172.23.193.194 | ssh, ftp, http, mysql, smtp, dns |
| windows-workstation | victim | 172.23.193.11 | smb, rdp, netbios, wmi, winrm |
| embedded-device | victim | 172.23.193.12 | telnet, snmp, tftp, http |
| network-appliance | victim | 172.23.193.13 | ssh, snmp, ntp, syslog, dhcp |

## Challenge Stages

### Stage 1

Host discovery across the network range

### Stage 2

Port scanning with different techniques (TCP, UDP, SYN, etc.)

### Stage 3

Service version detection and OS fingerprinting

### Stage 4

Script scanning for vulnerability detection

### Stage 5

Stealth scanning and firewall evasion techniques

### Stage 6

Performance optimization and timing controls

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
