# samba-guest-access-challenge-0nb8ib

## Description
A corporate file server running Samba has been misconfigured to allow guest access. Your task is to identify and exploit this misconfiguration to retrieve sensitive information stored on the server.

## Scenario
TechCorp recently deployed a new file server to share documents across departments. However, the system administrator made a critical error in the Samba configuration, allowing unauthorized access to sensitive files. As a penetration tester, you need to discover and exploit this vulnerability to demonstrate the security risk.

## Difficulty
medium

## Machines
- **samba-victim** (victim): 172.21.145.154 - samba, ssh
- **attacker** (attacker): 172.21.145.3 - 

## Hints
1. Start by scanning the target for open ports and services
2. SMB services often allow guest access when misconfigured
3. Try connecting to SMB shares without authentication using smbclient

## Flag Format
CTF{samba_guest_access_anonymous_share}
