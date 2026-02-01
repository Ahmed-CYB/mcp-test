# ftp-brute-force-corporate

## Description
A corporate FTP server has been misconfigured with weak authentication. Use brute force techniques to gain access and retrieve sensitive company data.

## Scenario
TechCorp Inc. recently deployed an FTP server for internal file sharing. The system administrator configured it hastily and used predictable credentials. Your task is to identify valid credentials through brute force attacks and retrieve the confidential project files stored on the server.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.21.145.130 - ftp
- **attacker** (attacker): 172.21.145.3 - 

## Hints
1. Start by scanning the target to identify open services and versions
2. Common usernames in corporate environments include admin, user, guest, backup, and company-related terms
3. Weak passwords often follow predictable patterns - try common passwords, variations of usernames, and year-based passwords
4. The admin user has access to the confidential directory where sensitive files are stored

## Flag Format
CTF{br0t3_f0rc3_ftp_m4st3r_2024}
