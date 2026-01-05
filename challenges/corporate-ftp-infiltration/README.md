# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your mission is to identify the vulnerability, gain access to the server, and retrieve the confidential flag hidden in the restricted directories.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to rushed deployment and inadequate security review, the server contains multiple misconfigurations. As a penetration tester, you've been tasked with identifying and exploiting these weaknesses to demonstrate the security risks to management.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.109 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Not all FTP servers require authentication to browse files
2. Some FTP configurations allow anonymous users to access restricted directories
3. Look for directories that might contain sensitive information - corporate environments often have predictable naming conventions

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
