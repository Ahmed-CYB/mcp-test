# samba-guest-infiltration

## Description
A corporate file server running Samba has been misconfigured, allowing unauthorized access to sensitive data. The system administrator failed to properly secure the SMB shares, creating a critical security vulnerability. Your mission is to identify and exploit this misconfiguration to retrieve confidential information stored on the server.

## Scenario
TechCorp's internal file server has been experiencing strange network activity. The IT department suspects that their Samba configuration might be exposing sensitive files to unauthorized users. As a penetration tester, you've been hired to assess the security of their file sharing infrastructure and determine if confidential data can be accessed without proper authentication.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.30.145.113 - samba, ssh
- **attacker-box** (attacker): 172.30.145.3 - ssh

## Hints
1. Network services often expose more than intended when misconfigured
2. SMB shares might allow guest access without authentication
3. The 'confidential' share name suggests it contains sensitive information

## Flag Format
CTF{samba_guest_access_anonymous_share}
