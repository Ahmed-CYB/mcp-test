# network-recon-challenge

## Description
A comprehensive network reconnaissance challenge where participants must use nmap and other tools to discover services, identify vulnerabilities, and extract sensitive information from a target system. The challenge involves multiple services with different security configurations.

## Scenario
You are a security consultant hired to perform a network security assessment of a corporate server. The target system is running multiple services, some of which may have misconfigurations or weak security settings. Your goal is to enumerate all services, identify potential vulnerabilities, and locate sensitive information that could be accessed by an attacker.

## Difficulty
medium

## Machines
- **target-server** (victim): 172.23.147.129 - ssh, ftp, samba, telnet
- **attacker** (attacker): 172.23.147.3 - 

## Hints
1. Start with a comprehensive nmap scan to discover all open ports and services
2. Some services allow anonymous or guest access - try connecting without credentials first
3. Look for services that might reveal information about user accounts or file locations
4. The flag is in the admin user's home directory, but you'll need proper credentials to access it

## Flag Format
CTF{n3tw0rk_r3c0n_m4st3r_2024}
