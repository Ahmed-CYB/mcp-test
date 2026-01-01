# Corporate Network Reconnaissance Challenge

## Scenario Description

A corporate network penetration test where participants must use nmap and other network tools to discover and enumerate three target machines with different service configurations. Each machine presents unique scanning challenges and contains flags accessible through proper service enumeration.

## Challenge Information

- **Categories:** network, web
- **Machines:** 4
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| scanner-workstation | attacker | 172.23.193.3 | nmap, wireshark, tcpdump, netcat, hping3, masscan, nc, net-tools, iputils-ping, python3, curl, wget, git, vim, nano, bash, ssh-client, smbclient, nfs-common, snmp, tftp |
| corporate-fileserver | victim | 172.23.193.45 | ftp, ssh, smb, nfs, snmp |
| legacy-database | victim | 172.23.193.11 | telnet, mysql, snmp, tftp |
| web-portal | victim | 172.23.193.12 | http, https, ssh, dns |

## Challenge Stages

### Stage 1

Initial network discovery using nmap host discovery techniques

### Stage 2

Port scanning and service enumeration on discovered targets

### Stage 3

Advanced nmap scripting and OS fingerprinting

### Stage 4

Service-specific enumeration to locate flags in configurations

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Web application vulnerability exploitation
