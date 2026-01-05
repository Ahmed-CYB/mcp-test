# ftp-anonymous-misconfiguration

## Description
A corporate file server has been misconfigured to allow anonymous FTP access. The system administrator accidentally enabled anonymous login with write permissions to sensitive directories. Your task is to exploit this misconfiguration to gain access to confidential files and potentially escalate privileges.

## Scenario
TechCorp recently deployed a new file server for sharing project documents. The system administrator, rushing to meet a deadline, misconfigured the FTP service to allow anonymous access with excessive permissions. Security audits have detected suspicious FTP activity, and you've been hired to assess the vulnerability. The flag contains sensitive corporate information that should never be accessible to anonymous users.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.145.39 - ftp, ssh
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Anonymous FTP access might be enabled - try connecting without credentials
3. Look for directories that allow anonymous read access and explore the file structure
4. Check for sensitive files in directories that shouldn't be accessible to anonymous users

## Flag Format
CTF{anonymous_ftp_access_leads_to_data_breach_2024}
