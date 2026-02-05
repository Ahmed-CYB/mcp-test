# ftp-brute-force-challenge

## Description
A corporate FTP server has been discovered during reconnaissance. The server appears to be running with default or weak credentials. Your task is to perform a brute force attack to gain access and retrieve sensitive information from the server.

## Scenario
During a penetration test of Acme Corp's network infrastructure, you've identified an FTP server running on the target machine. Initial reconnaissance suggests the server may be using weak authentication. Your objective is to brute force the FTP credentials and locate the flag containing sensitive corporate data.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **ftp-server** (victim): 172.30.145.160 - ftp, ssh
## Victim credentials (brute force)
- **Username to use**: `support`
- **Wordlist on attacker machine**: `/usr/share/wordlists/rockyou.txt` (ensure it exists; on Kali it may be `rockyou.txt.gz` — decompress with `gunzip -k /usr/share/wordlists/rockyou.txt.gz` if needed).
Find the password using the wordlist above (e.g. with Hydra or Medusa).

## Hints
1. Start with network reconnaissance to identify the FTP service and its version
2. Common usernames for corporate environments include: admin, backup, guest, user, test
3. Try dictionary attacks with common passwords before attempting exhaustive brute force

## Flag Format
CTF{...}

