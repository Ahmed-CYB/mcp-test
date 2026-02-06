# ftp-anonymous-infiltration

## Description
A corporate FTP server has been misconfigured to allow anonymous access. Intelligence suggests sensitive documents may be stored in hidden directories. Your mission is to infiltrate the FTP server, navigate through the directory structure, and locate the classified information.

## Scenario
TechCorp's file server administrator made a critical mistake while configuring their FTP service. The server allows anonymous connections and contains sensitive corporate data in nested directories. As a penetration tester, you need to exploit this misconfiguration to access the classified documents and prove the security vulnerability.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **ftp-server** (victim): 172.25.145.163 - ftp, ssh
## Victim credentials
- **ftp-server**: `runner` / `secret`

## Hints
1. Anonymous FTP access might be enabled on this server
2. Try connecting to FTP without credentials and explore the directory structure
3. Look for directories that might contain sensitive information beyond the public folder

## Flag Format
CTF{...}

