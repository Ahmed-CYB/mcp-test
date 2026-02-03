# ftp-anonymous-infiltration

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to exploit the FTP service vulnerabilities to gain access and retrieve the hidden flag from the server's file system.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to poor security practices, the server has multiple vulnerabilities including anonymous access and writable directories. As a penetration tester, you need to identify and exploit these weaknesses to demonstrate the security risks.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.23.146.3 - ssh
- **ftp-server** (victim): 172.23.146.145 - ftp, ssh

## Hints
1. Start by scanning the target to identify open ports and services
2. FTP servers sometimes allow anonymous login - try connecting without credentials
3. Look for directories with write permissions that might contain sensitive files
4. The flag might be hidden in a subdirectory that requires directory traversal

## Flag Format
CTF{...}
