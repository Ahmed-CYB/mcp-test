# corporate-ftp-breach

## Description
A corporate FTP server has been discovered during reconnaissance. The system administrator has implemented what they believe to be secure authentication, but rumors suggest that weak password policies might be in place. Your mission is to gain unauthorized access to the FTP server and retrieve sensitive corporate data.

## Scenario
TechCorp Industries has deployed an FTP server for file sharing between departments. The server is protected by username/password authentication, but employees have been complaining about overly complex password requirements. To appease users, the IT department may have relaxed their password policy. Intelligence suggests that standard corporate usernames might be in use with predictable passwords.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.29.193.114 - ftp
- **attacker** (attacker): 172.29.193.3 - 

## Hints
1. Corporate environments often use predictable naming conventions for user accounts
2. Password policies in corporate settings sometimes favor convenience over security
3. Common corporate usernames include: admin, manager, support, backup, guest

## Flag Format
CTF{ftp_brute_force_success_2024}
