# samba-anonymous-access-challenge

## Description
A corporate file server has been misconfigured, allowing anonymous access to sensitive shares. Your mission is to identify the vulnerable Samba service and retrieve the hidden corporate document that contains critical information.

## Scenario
During a penetration test of TechCorp's internal network, you've discovered a file server that appears to have weak security controls. The system administrator mentioned that some shares might be accessible without proper authentication. Your task is to enumerate the Samba shares, gain unauthorized access, and locate the confidential document that contains the flag.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.23.145.89 - samba, ssh
- **attacker** (attacker): 172.23.145.3 - ssh

## Hints
1. Start by scanning the network to identify open ports and services
2. The Samba service might allow guest or anonymous access to certain shares
3. Use smbclient or enum4linux to enumerate available shares without authentication
4. Look for hidden files in accessible directories - they might contain sensitive information

## Flag Format
CTF{samba_anonymous_access_exposed}
