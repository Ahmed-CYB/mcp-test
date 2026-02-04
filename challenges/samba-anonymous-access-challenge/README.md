# samba-anonymous-access-challenge

## Description
A corporate file server is running an outdated Samba configuration with security misconfigurations. Your task is to identify and exploit the anonymous access vulnerability to retrieve sensitive information from the shared directories.

## Scenario
During a penetration test of Acme Corp's internal network, you've discovered a file server running Samba. The system administrator has misconfigured the service, allowing unauthorized access to sensitive company data. Your objective is to exploit this vulnerability and retrieve the flag from the exposed share.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.23.146.3 - ssh
- **samba-server** (victim): 172.23.146.40 - samba, ssh

## Hints
1. Start by scanning the target to identify open ports and services
2. Look for SMB/CIFS services and check if anonymous access is allowed
3. Use smbclient to list and access shares without authentication

## Flag Format
CTF{...}
