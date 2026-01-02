# Corporate Network Reconnaissance Challenge

## Scenario Description

Penetration test of TechCorp's internal network infrastructure. Use network scanning techniques to discover services across three target machines and piece together the complete network picture.

## Challenge Information

- **Categories:** network, web
- **Machines:** 4
- **Stages:** 4

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| attacker | attacker | 172.23.206.3 | nmap, wireshark, tcpdump, netcat, hping3, masscan, ssh-client, smbclient, nfs-common, snmp, tftp, python3, curl, wget |
| webserver-alpha | victim | 172.23.206.57 | http, https, ssh, ftp |
| fileserver-beta | victim | 172.23.206.11 | smb, nfs, ssh, snmp |
| database-gamma | victim | 172.23.206.12 | mysql, telnet, ssh, ldap |

## Challenge Stages

### Stage 1

Initial network discovery using nmap to identify live hosts and open ports

### Stage 2

Service enumeration and version detection on discovered targets

### Stage 3

Exploit discovered services to extract flag fragments and network intelligence

### Stage 4

Combine gathered intelligence to reconstruct the complete flag

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Web application vulnerability exploitation
