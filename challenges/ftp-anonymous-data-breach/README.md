# ftp-anonymous-data-breach

## Description
A corporate FTP server has been misconfigured to allow anonymous access with write permissions. The server contains sensitive data that should not be publicly accessible. Your goal is to exploit the FTP service to retrieve the hidden flag.

## Scenario
TechCorp recently set up an FTP server for file sharing between departments. The system administrator made several configuration mistakes that expose sensitive corporate data. As a penetration tester, you need to identify and exploit these FTP vulnerabilities to access classified information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.26.145.159 - ftp, ssh
- **attacker** (attacker): 172.26.145.3 - 

## Hints
1. Start with a port scan to identify running services on the target machine.
2. Check if the FTP service allows anonymous login without credentials.
3. Explore the directory structure to find sensitive data that shouldn't be publicly accessible.
4. Look for directories that might contain classified or confidential information.

## Flag Format
CTF{ftp_anonymous_access_is_dangerous}
