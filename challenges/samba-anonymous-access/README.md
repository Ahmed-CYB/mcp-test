# samba-anonymous-access

## Description
A company's file server is running Samba with misconfigured access controls. Anonymous users can access sensitive directories containing confidential information. Your task is to exploit this misconfiguration and retrieve the hidden flag.

## Scenario
TechCorp recently deployed a new file server running Samba to share documents across the organization. The system administrator hastily configured the service and accidentally enabled anonymous access to sensitive directories. As a penetration tester, you need to identify and exploit this vulnerability to demonstrate the security risk.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.23.145.31 - samba, ssh
- **attacker** (attacker): 172.23.145.3 - ssh

## Hints
1. Start by scanning the target to identify open ports and services
2. SMB services often allow anonymous or guest access - try connecting without credentials
3. Use smbclient to list and access shares: smbclient -L //target -N
4. Look for shares that allow guest access and browse their contents recursively

## Flag Format
CTF{samba_anonymous_access_vulnerability}
