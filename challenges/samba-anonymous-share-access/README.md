# samba-anonymous-share-access

## Description
A Linux server running Samba has been misconfigured, allowing anonymous access to sensitive file shares. Your task is to identify and exploit this misconfiguration to retrieve the flag from the shared directory.

## Scenario
TechCorp's file server is running Samba to provide network file sharing services. A system administrator has recently configured the server but made a critical security mistake by enabling anonymous access to certain shares. As a penetration tester, you need to identify this vulnerability and access the confidential files stored on the server.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.20.145.165 - samba, ssh
- **attacker** (attacker): 172.20.145.3 - 

## Hints
1. Network services often have default configurations that allow guest access.
2. SMB shares can sometimes be accessed without authentication - try listing available shares first.
3. The 'guest ok' parameter in Samba configuration might reveal accessible shares to anonymous users.

## Flag Format
CTF{samba_anonymous_share_access}
