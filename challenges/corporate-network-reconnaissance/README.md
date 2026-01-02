# Corporate Network Reconnaissance

## Scenario Description

A corporate network has been misconfigured with several exposed services. Use network mapping and service enumeration to discover the network topology and locate sensitive information.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 3
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker-workstation | attacker | 172.23.201.3 | nmap, wireshark, tcpdump, netcat, hping3, masscan, ssh-client, smbclient, python3, curl, wget |
| corporate-gateway | victim | 172.23.201.136 | ssh, ftp, telnet, snmp |
| internal-fileserver | victim | 172.23.201.11 | smb, ssh, tftp |

## Challenge Stages

### Stage 1

Perform initial network discovery to identify active hosts

### Stage 2

Conduct detailed service enumeration to identify versions and configurations

### Stage 3

Use SNMP to gather network topology information

### Stage 4

Access internal file shares to retrieve the encrypted flag

### Stage 5

Decrypt the final flag using information gathered during reconnaissance

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
