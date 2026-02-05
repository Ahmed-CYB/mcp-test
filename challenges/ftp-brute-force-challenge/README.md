# ftp-brute-force-challenge

## Description
A vulnerable FTP server with weak credentials that can be compromised through brute force attacks. Use wordlist attacks to gain unauthorized access and retrieve the hidden flag.

## Scenario
You've discovered an FTP server running on a corporate network. Intelligence suggests they're using weak passwords from common wordlists. Your mission is to brute force the FTP credentials and retrieve sensitive data.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **ftp-server** (victim): 172.30.145.109 - ftp, ssh
## Victim credentials
Find valid credentials using common wordlists (e.g. rockyou.txt, user name lists). Services may accept weak or default credentials.

## Hints
1. Start by scanning the target to identify open FTP service and its configuration
2. Common usernames like 'admin', 'backup', 'guest' are often used with weak passwords
3. Tools like Hydra can efficiently brute force FTP credentials using wordlists like rockyou.txt

## Flag Format
CTF{...}

