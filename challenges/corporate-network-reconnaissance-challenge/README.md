# Corporate Network Reconnaissance Challenge

## Scenario Description

A corporate network has been segmented for security, but poor configuration has left multiple services exposed. Use network scanning techniques to map the infrastructure, identify vulnerabilities, and piece together the complete flag from distributed sources.

## Challenge Information

- **Categories:** network, crypto, web
- **Machines:** 4
- **Stages:** 6

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.206.3 | nmap, masscan, hping3, netcat, tcpdump, wireshark, ssh-client, smbclient, snmp, telnet, ftp, tftp |
| corporate-fileserver | victim | 172.23.206.68 | ftp, smb, ssh, snmp |
| development-webserver | victim | 172.23.206.11 | http, ssh, telnet, mysql |
| backup-storage | victim | 172.23.206.12 | nfs, tftp, snmp, telnet |

## Challenge Stages

### Stage 1

Perform comprehensive network discovery using nmap and other scanning tools

### Stage 2

Enumerate services on each discovered machine to identify entry points

### Stage 3

Extract network topology information from the corporate file server

### Stage 4

Access the development web server to find database credentials

### Stage 5

Use gathered credentials to access the backup storage system

### Stage 6

Combine encrypted flag fragments from all three systems to reveal the final flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
- Web application vulnerability exploitation
