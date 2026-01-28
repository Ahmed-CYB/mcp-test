# samba-guest-infiltration

## Description
A corporate file server running Samba has been misconfigured, allowing unauthorized access to sensitive company data. Your mission is to exploit the SMB service to gain access to confidential files and retrieve the flag hidden within the shared directories.

## Scenario
TechCorp recently deployed a new file server running Samba for internal document sharing. The system administrator made several configuration mistakes during the initial setup, leaving the server vulnerable to unauthorized access. As a penetration tester, you need to identify and exploit these misconfigurations to demonstrate the security risks and retrieve sensitive information.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.30.145.158 - samba, ssh
- **attacker** (attacker): 172.30.145.3 - ssh

## Hints
1. Start by scanning the target to identify open ports and running services
2. SMB services often allow guest access or null sessions for enumeration
3. Use smbclient to list and access shares without authentication
4. Look for shares that allow guest access and browse their contents for sensitive files

## Flag Format
CTF{samba_guest_share_infiltration}
