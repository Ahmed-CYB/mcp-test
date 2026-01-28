# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your mission is to exploit the FTP service vulnerabilities to gain access to classified documents and retrieve the hidden flag.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to rushed deployment and inadequate security review, the server contains multiple misconfigurations. As a penetration tester, you've been tasked with identifying and exploiting these vulnerabilities to demonstrate the security risks.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.145.197 - ftp, ssh
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Start with a port scan to identify running services and their versions
2. FTP servers often allow anonymous access - check if you can login without credentials
3. Look for writable directories that might contain sensitive files or allow file uploads
4. Some FTP accounts use weak or default credentials - try common username/password combinations

## Flag Format
CTF{ftp_m1sc0nf1gur4t10n_3xpl01t3d}
