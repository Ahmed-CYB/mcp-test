# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your mission is to identify the vulnerability, gain access to the server, and retrieve the confidential document containing the flag.

## Scenario
TechCorp Industries recently set up an FTP server for file sharing between departments. The system administrator, under pressure to meet deadlines, made several configuration mistakes that left the server vulnerable. Intelligence suggests that sensitive financial documents are stored in a restricted directory. Can you exploit the misconfigurations to access the classified information?

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.208.100 - ftp

## Hints
1. The FTP server might allow connections without proper authentication.
2. Anonymous FTP access is often enabled by default. Try connecting with 'anonymous' as the username.
3. Look for sensitive directories like 'finance' or 'confidential' that might contain important documents.

## Flag Format
CTF{ftp_m1sc0nf1g_l3ads_t0_data_br3ach}
