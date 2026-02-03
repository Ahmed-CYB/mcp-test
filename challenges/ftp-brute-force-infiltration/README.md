# ftp-brute-force-infiltration

## Description
A corporate FTP server has been misconfigured with weak authentication. Your task is to perform a brute force attack to gain access and retrieve sensitive information from the server.

## Scenario
During a penetration test of Acme Corp's network infrastructure, you've discovered an FTP server running on the network. Initial reconnaissance suggests the server may have weak credentials. Your objective is to brute force the FTP login credentials and retrieve the confidential flag from the server's directory structure.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.23.146.3 - ssh
- **ftp-server** (victim): 172.23.146.157 - ftp, ssh

## Hints
1. Start with network reconnaissance to identify the FTP service and its configuration
2. Common usernames in corporate environments include admin, backup, guest, service, and test
3. Use a targeted wordlist focusing on common weak passwords and variations
4. Once authenticated, explore the directory structure thoroughly for sensitive files

## Flag Format
CTF{...}
