# samba-anonymous-share-access

## Description
A misconfigured Samba server allows anonymous access to sensitive shares. Your goal is to enumerate the network, discover the Samba service, and exploit the anonymous access vulnerability to retrieve the hidden flag.

## Scenario
During a penetration test, you've discovered a Linux server running Samba file sharing services. The system administrator has misconfigured the Samba server to allow anonymous access to certain shares. Your task is to identify the vulnerable Samba service, enumerate the available shares, and access the restricted data to capture the flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.20.145.3 - ssh
- **victim** (victim): 172.20.145.176 - samba, ssh

## Hints
1. Start by scanning the network to identify running services
2. Look for SMB/CIFS services running on standard ports
3. Try accessing SMB shares without authentication using null sessions

## Flag Format
CTF{...}
