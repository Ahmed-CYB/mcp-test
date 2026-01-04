# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company documents. Your task is to identify the vulnerability and retrieve the confidential flag.

## Scenario
TechCorp Inc. recently deployed an FTP server for internal file sharing. The system administrator configured the server hastily and may have overlooked some security settings. Intelligence suggests that sensitive documents containing the company's quarterly reports are stored on this server. Your mission is to gain access and retrieve the classified information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.56 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. The FTP server might allow connections without proper authentication
2. Check if anonymous login is enabled and explore the directory structure
3. Look for sensitive files in directories that might seem restricted but are actually accessible

## Flag Format
CTF{ftp_4n0nym0us_4cc3ss_c0mpr0m1s3d}
