# anonymous-ftp-infiltration

## Description
A corporate file server has been misconfigured to allow anonymous FTP access. Your task is to identify the vulnerable service and retrieve sensitive company data that was accidentally exposed.

## Scenario
TechCorp recently set up a new file server for their development team. The system administrator, rushing to meet a deadline, enabled anonymous FTP access for quick file transfers but forgot to properly secure the server. Intelligence suggests that confidential project files may be accessible without authentication. Your mission is to scan the target, identify the vulnerable FTP service, and retrieve the sensitive data.

## Difficulty
easy

## Machines
- **ftp-server** (victim): 172.24.193.17 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Some FTP servers allow anonymous login without credentials - try using 'anonymous' as username
3. Once connected, explore the directory structure to find sensitive files that shouldn't be publicly accessible

## Flag Format
CTF{4n0nym0u5_ftp_15_d4ng3r0u5}
