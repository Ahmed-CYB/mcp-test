# corporate-data-breach

## Description
A corporate server has been misconfigured, allowing unauthorized access to sensitive data. The FTP service appears to be running with weak security settings. Your task is to identify the vulnerability, gain access to the system, and retrieve the confidential flag.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to rushed deployment, the server was configured with poor security practices. As a penetration tester, you've been hired to assess the security of their network infrastructure and demonstrate potential data breaches.

## Difficulty
medium

## Machines
- **techcorp-ftp** (victim): 172.25.193.34 - ftp

## Hints
1. Start with a comprehensive port scan to identify running services
2. Anonymous FTP access might be enabled - try connecting without credentials
3. Explore the directory structure thoroughly - sensitive data might be in restricted folders
4. Some directories may have different permission settings than others

## Flag Format
CTF{ftp_anonymous_access_is_dangerous_2024}
