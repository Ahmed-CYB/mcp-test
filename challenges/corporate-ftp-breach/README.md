# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to identify the vulnerability, gain access to the server, and retrieve the confidential flag hidden within the system.

## Scenario
TechCorp Inc. recently deployed an FTP server for file sharing between departments. The system administrator, rushing to meet a deadline, made several configuration mistakes that have left the server vulnerable. Intelligence suggests that sensitive corporate documents are stored on this server. Your mission is to exploit the FTP service vulnerabilities to gain access and retrieve the classified information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.29.193.127 - ftp, ssh
- **attacker** (attacker): 172.29.193.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. FTP servers sometimes allow anonymous access - try connecting without credentials
3. Explore the directory structure thoroughly - sensitive files might be in subdirectories
4. Look for directories with different permission levels - some might contain restricted data

## Flag Format
CTF{ftp_anonymous_access_is_dangerous_2024}
