# ftp-anonymous-infiltration

## Description
A corporate server has been misconfigured to allow anonymous FTP access. Your mission is to infiltrate the FTP server, navigate through the directory structure, and locate sensitive information that has been inadvertently exposed.

## Scenario
SecureCorp's IT department recently set up an FTP server for file sharing but made a critical configuration error. The server allows anonymous access and contains confidential files in nested directories. As a penetration tester, you need to exploit this misconfiguration to retrieve the hidden flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **ftp-server** (victim): 172.25.145.36 - ftp, ssh
## Victim credentials
- **ftp-server**: `machine` / `playground`

## Hints
1. Start by scanning the target to identify available services
2. FTP servers sometimes allow anonymous access - try connecting without credentials
3. Corporate directories often have nested folder structures - explore thoroughly

## Flag Format
CTF{...}

