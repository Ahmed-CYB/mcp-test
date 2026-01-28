# nmap-discovery-challenge

## Description
Use nmap to discover hidden services and locate flags scattered across different network services. This challenge tests your network reconnaissance skills and ability to identify running services, open ports, and extract information from various network protocols.

## Scenario
You've gained access to a corporate network and need to perform reconnaissance on a target server. The server is running multiple services, and flags have been strategically placed in different locations that can only be discovered through proper nmap scanning techniques. Your mission is to use various nmap scan types to uncover all hidden flags.

## Difficulty
medium

## Machines
- **target-server** (victim): 172.23.145.25 - ssh, ftp, http, samba
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start with a basic nmap scan to discover open ports and services
2. Try different nmap scan types: -sV for version detection, -sC for default scripts, -A for aggressive scan
3. Some flags might be hidden in service banners or require script scanning to discover
4. Don't forget to check common files like robots.txt and try anonymous access where possible
5. Use nmap's HTTP enumeration scripts to find hidden content and grep for flags in responses

## Flag Format
CTF{nmap_flag_1}, CTF{nmap_flag_2}, CTF{nmap_flag_3}
