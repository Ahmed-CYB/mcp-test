# ftp-anonymous-data-exfiltration

## Description
A corporate FTP server has been misconfigured to allow anonymous access. Your task is to connect to the FTP server, navigate through the directory structure, and locate sensitive files that may contain flags or confidential information.

## Scenario
You've discovered an FTP server running on a corporate network. Intelligence suggests that the server may be misconfigured to allow anonymous access, and there might be sensitive data stored in various directories. Your mission is to gain access to the FTP server and extract any valuable information.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **ftp-server** (victim): 172.30.145.196 - ftp, ssh
## Victim credentials
- **ftp-server**: `dev` / `pwnme`

## Hints
1. Start by scanning the target to identify open services and ports
2. FTP servers sometimes allow anonymous access - try connecting without credentials
3. Explore all available directories systematically - sensitive data might be in unexpected locations

## Flag Format
CTF{...}

