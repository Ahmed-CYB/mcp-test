# nmap-reconnaissance-mastery

## Description
Master network reconnaissance using nmap to discover services, versions, and vulnerabilities on a target system. This challenge focuses on advanced nmap techniques including service detection, version scanning, script scanning, and OS fingerprinting.

## Scenario
You are a penetration tester hired to assess the security of a corporate server. The target system is running multiple services with varying security configurations. Use nmap to thoroughly enumerate the target, identify service versions, detect potential vulnerabilities, and locate the hidden flag through comprehensive reconnaissance.

## Difficulty
medium

## Machines
- **target-server** (victim): 172.25.145.120 - ssh, ftp, http, samba
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Start with a basic nmap scan to discover open ports on the target
2. Use nmap's service version detection (-sV) to identify running services and their versions
3. Try nmap scripts (-sC or --script) to gather more detailed information about discovered services
4. Anonymous FTP access might reveal interesting directories - use nmap's ftp-anon script
5. The flag is hidden in a directory that relates to the primary skill being practiced in this challenge

## Flag Format
CTF{nm4p_m4st3r_r3c0nn41ss4nc3_2024}
