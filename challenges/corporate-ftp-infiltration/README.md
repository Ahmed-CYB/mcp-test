# corporate-ftp-infiltration

## Description
A corporate FTP server has been discovered during reconnaissance. The server appears to use weak authentication mechanisms. Your task is to gain access to the FTP server and retrieve sensitive corporate documents.

## Scenario
During a penetration test of Acme Corporation, you've discovered an FTP server running on their internal network. Initial scans show that the server allows authentication but may be vulnerable to brute force attacks. Intelligence suggests that employees use common passwords and the company follows predictable naming conventions. Your objective is to brute force the FTP credentials and locate the flag containing sensitive corporate information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.122 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Start with network reconnaissance to identify open services and their versions
2. Common corporate usernames often follow predictable patterns like admin, manager, employee
3. Corporate passwords frequently contain company names, years, or common patterns like 'password123'
4. The flag is located in a restricted directory that requires valid credentials to access

## Flag Format
CTF{ftp_brut3_f0rc3_5ucc355_2024}
