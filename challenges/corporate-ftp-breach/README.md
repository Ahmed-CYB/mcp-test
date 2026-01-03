# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to exploit the vulnerabilities and retrieve the confidential flag.

## Scenario
TechCorp has recently deployed an FTP server for file sharing between departments. The system administrator made several configuration mistakes that have left the server vulnerable to attack. Intelligence suggests that sensitive corporate documents, including the flag, are stored in a restricted directory on the server.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.22 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Some FTP servers allow connections without proper authentication
2. Anonymous FTP access might be enabled - try connecting without credentials
3. Corporate data might be stored in a predictable directory structure

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
