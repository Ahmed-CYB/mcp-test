# corporate-network-recon

## Description
A corporate server has been discovered on the network. Use nmap to perform reconnaissance and discover all running services, their versions, and potential vulnerabilities. This challenge simulates a real-world penetration testing scenario where you must gather intelligence about a target system.

## Scenario
You are conducting an authorized penetration test for CyberCorp Inc. The IT department has provided you with the IP address of their development server and asked you to assess its security posture. Your task is to use nmap to discover all running services, identify potential security issues, and locate sensitive information. The server is running multiple services that are commonly found in corporate environments.

## Difficulty
medium

## Machines
- **corporate-server** (victim): 172.23.145.60 - ssh, ftp, samba, telnet, http
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start with a basic port scan to discover open ports on the target system
2. Use nmap's service version detection (-sV) to identify running services and their versions
3. Try different nmap scan types like TCP SYN scan (-sS) and UDP scan (-sU) for comprehensive coverage
4. Use nmap scripts (--script) to detect specific vulnerabilities and gather more information about services

## Flag Format
CTF{nmap_reconnaissance_master_2024}
