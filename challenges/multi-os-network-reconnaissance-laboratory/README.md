# Multi-OS Network Reconnaissance Laboratory

## Scenario Description

A comprehensive nmap training environment featuring four different Linux distributions, each configured with unique network services and port configurations. Practice advanced scanning techniques, OS fingerprinting, service enumeration, and stealth scanning across diverse target systems.

## Challenge Information

- **Categories:** network
- **Machines:** 5
- **Stages:** 7

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| scanner-kali | attacker | 172.23.193.3 | ssh |
| ubuntu-webserver | victim | 172.23.193.174 | http, https, ssh, mysql, ftp, dns |
| centos-enterprise | victim | 172.23.193.11 | ssh, telnet, smb, nfs, snmp, ldap |
| alpine-minimal | victim | 172.23.193.12 | ssh, tftp, netcat, ping, traceroute |
| debian-legacy | victim | 172.23.193.13 | ftp, telnet, rsh, finger, echo, discard, chargen |

## Challenge Stages

### Stage 1

Initial network discovery and host enumeration using ping sweeps and ARP scans

### Stage 2

Port scanning with various nmap techniques (TCP SYN, TCP Connect, UDP, stealth scans)

### Stage 3

Service version detection and banner grabbing across different services

### Stage 4

Operating system fingerprinting and detection across multiple Linux distributions

### Stage 5

Advanced nmap scripting engine (NSE) usage for vulnerability detection

### Stage 6

Network timing and evasion techniques against different target responses

### Stage 7

Comprehensive reporting and analysis of discovered network infrastructure

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
