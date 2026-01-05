# ftp-anonymous-infiltration

## Description
A corporate file server running FTP has been misconfigured, allowing unauthorized access to sensitive company data. Your mission is to exploit the FTP service vulnerabilities to retrieve the confidential flag hidden within the server's directory structure.

## Scenario
TechCorp Industries has deployed an FTP server for file sharing between departments. Due to a misconfiguration by the system administrator, the server allows anonymous access and has writable directories that shouldn't be accessible. Security auditors have discovered that sensitive files containing company secrets are stored on this server. Your task is to exploit the FTP vulnerabilities to access the restricted areas and retrieve the classified information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.146.48 - ftp, ssh
- **attacker** (attacker): 172.23.146.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Check if the FTP service allows anonymous login without credentials
3. Explore the directory structure thoroughly - some folders might have different permissions
4. Look for directories that might contain sensitive information, even if they seem restricted

## Flag Format
CTF{ftp_4n0nym0us_4cc3ss_c0mpr0m1s3d}
