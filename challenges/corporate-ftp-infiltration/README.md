# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured with weak authentication mechanisms. Your task is to gain access through credential brute forcing and retrieve sensitive company documents.

## Scenario
TechCorp Industries runs an internal FTP server for document sharing between departments. A recent security audit revealed that the server may be vulnerable to brute force attacks due to weak password policies and account lockout mechanisms being disabled. As a penetration tester, you need to identify valid credentials and access confidential files.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.145.168 - ftp
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start by scanning the target to identify open ports and running services
2. The FTP server allows multiple login attempts without account lockout - perfect for brute forcing
3. Common usernames in corporate environments include admin, manager, developer, backup, guest, and support
4. Use tools like hydra or medusa with common password lists to automate the brute force attack

## Flag Format
CTF{ftp_br00t3_f0rc3_m4st3r_2024}
