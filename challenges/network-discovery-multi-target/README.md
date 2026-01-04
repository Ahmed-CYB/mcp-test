# network-discovery-multi-target

## Description
A multi-machine network reconnaissance challenge where participants must use nmap to discover and enumerate services across different targets. Each machine hosts different services with varying security configurations, requiring thorough network scanning techniques to uncover all vulnerabilities and locate the distributed flags.

## Scenario
You've gained access to a corporate network segment containing multiple servers. Intelligence suggests that sensitive data is distributed across different machines, each running various services. Your mission is to conduct a comprehensive network reconnaissance using nmap to identify all active hosts, enumerate running services, detect vulnerabilities, and locate the flags hidden on each system. The network administrator has implemented different security measures on each machine, so you'll need to employ various nmap scanning techniques to bypass firewalls and service filters.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.53 - ftp, ssh
- **web-server** (victim): 172.24.193.104 - http, ssh
- **database-server** (victim): 172.24.193.36 - mysql, telnet, ssh
- **file-server** (victim): 172.24.193.136 - samba, ssh
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Start with a comprehensive network scan to discover all active hosts and their open ports
2. Different nmap scan types (-sS, -sV, -sC) will reveal different information about each service
3. Some services allow anonymous or guest access - enumerate shares and directories carefully
4. Check for common service banners and version information that might reveal vulnerabilities

## Flag Format
CTF{ftp_anonymous_access_discovered}
