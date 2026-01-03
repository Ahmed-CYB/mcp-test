# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive files. Your task is to identify the vulnerability, gain access to the FTP server, and retrieve the confidential flag containing financial data.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to rushed deployment and inadequate security review, the server contains several misconfigurations. Intelligence suggests that sensitive financial documents are stored on this server. Your mission is to exploit these weaknesses and retrieve the classified information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.196 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. The FTP server might allow connections without proper authentication
2. Anonymous FTP access is often misconfigured in corporate environments
3. Look for sensitive directories that might contain financial documents

## Flag Format
CTF{ftp_m1sc0nf1g_3xpl01t3d}
