# ftp-anonymous-infiltration

## Description
A corporate FTP server has been misconfigured to allow anonymous access. Your mission is to infiltrate the server, navigate through the directory structure, and locate sensitive information that could compromise the organization's security.

## Scenario
TechCorp's system administrator hastily configured an FTP server for file sharing but made a critical security mistake - anonymous access was enabled. Intelligence suggests that confidential project files and system information are stored on this server. Your task is to exploit this misconfiguration, explore the server's directory structure, and extract valuable data.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **ftp-server** (victim): 172.25.145.149 - ftp, ssh
## Victim credentials
- **ftp-server**: `service` / `getflag`

## Hints
1. Anonymous FTP access might be enabled - try connecting without credentials
2. Explore the directory structure thoroughly - sensitive files are often stored in subdirectories
3. Use FTP commands like 'ls -la' and 'cd' to navigate and discover hidden directories

## Flag Format
CTF{...}

