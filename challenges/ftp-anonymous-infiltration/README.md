# ftp-anonymous-infiltration

## Description
A corporate FTP server has been misconfigured to allow anonymous access. Your task is to infiltrate the server, explore the file system, and locate sensitive information that may contain the flag.

## Scenario
TechCorp's file server administrator made a critical error in the FTP configuration, inadvertently enabling anonymous access to the company's internal file repository. As a penetration tester, you've been tasked with demonstrating the security implications of this misconfiguration by accessing the server and retrieving confidential data.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **ftp-server** (victim): 172.25.145.165 - ftp, ssh
## Victim credentials
- **ftp-server**: `service` / `letmein`

## Hints
1. Start by scanning the target to identify running services and their versions
2. FTP servers sometimes allow anonymous access - try connecting without credentials
3. Explore all available directories and subdirectories systematically
4. Corporate environments often have structured directory hierarchies - look for business-related folder names

## Flag Format
CTF{...}

