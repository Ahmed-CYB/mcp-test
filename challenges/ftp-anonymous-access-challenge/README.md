# ftp-anonymous-access-challenge

## Description
A corporate file server has been misconfigured, allowing anonymous FTP access to sensitive directories. Your task is to identify the vulnerability, gain access to the FTP server, and retrieve the confidential flag hidden in the system.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to poor security practices, the server has been misconfigured with anonymous access enabled and writable directories exposed. As a security consultant, you need to demonstrate the risks by accessing the server and retrieving sensitive information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.145.21 - ftp, ssh
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Not all services require authentication - some allow guest access
2. FTP servers often have anonymous login capabilities for public file sharing
3. Look for directories that might contain sensitive information like 'classified' or 'confidential'

## Flag Format
CTF{samba_anonymous_share_access_pwned}
