# ftp-brute-force-medium

## Description
A corporate FTP server has been misconfigured with weak authentication. Your task is to perform a brute force attack to gain access and retrieve sensitive information. The server uses a common username with a weak password from a standard wordlist.

## Scenario
During a penetration test of Acme Corporation, you've discovered an FTP server running on the network. Initial reconnaissance shows that anonymous access is disabled, but the server accepts authentication attempts. Intelligence suggests that the administrator uses common usernames with weak passwords. Your goal is to brute force the credentials and access confidential files.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.28.145.3 - ssh
- **ftp-server** (victim): 172.28.145.52 - ftp, ssh

## Hints
1. Start with network reconnaissance to identify open ports and services
2. The FTP service accepts authentication attempts - try common usernames
3. Use a brute force tool with a wordlist containing common passwords

## Flag Format
CTF{...}
