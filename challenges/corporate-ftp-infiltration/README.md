# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured, allowing anonymous access to sensitive directories. Your mission is to infiltrate the server, escalate privileges, and retrieve the confidential flag from the restricted area.

## Scenario
TechCorp's IT department recently deployed an FTP server for file sharing between departments. Due to a configuration oversight, the server allows anonymous login and has weak user credentials. Intelligence suggests that sensitive corporate documents, including the flag, are stored in a restricted directory accessible only to authenticated users.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.134 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Not all FTP servers require authentication for initial access
2. Sometimes configuration files contain useful information about user accounts
3. Weak passwords often follow predictable patterns mentioned in documentation
4. The flag is in a directory that requires authenticated access as a specific user

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
