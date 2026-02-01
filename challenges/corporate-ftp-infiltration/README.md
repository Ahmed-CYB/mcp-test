# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured with weak authentication. Your task is to gain unauthorized access through credential brute forcing and retrieve sensitive company data.

## Scenario
TechCorp's IT department hastily deployed an FTP server for file sharing between departments. Due to poor security practices, they've implemented weak password policies and left default accounts active. As a penetration tester, you need to identify valid credentials and access confidential files.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.145.168 - ftp
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start by scanning for open ports to identify the FTP service
2. Anonymous access is disabled, but the server accepts local user authentication
3. Common usernames in corporate environments often include: admin, backup, guest, ftpuser
4. Weak passwords might follow patterns like username123, username2023, or simple words like 'welcome' and 'password'

## Flag Format
CTF{br00t3_f0rc3_ftp_m4st3r}
