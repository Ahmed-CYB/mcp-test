# corporate-data-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to identify the vulnerability, gain access to the server, and retrieve the confidential flag containing leaked customer information.

## Scenario
TechCorp Industries recently set up an FTP server to share files between departments. However, the system administrator made several configuration mistakes that could lead to a serious data breach. As a penetration tester, you need to assess the security of this FTP server and demonstrate the potential impact of these misconfigurations.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.193.168 - ftp

## Hints
1. Not all FTP servers require authentication - some allow guest access
2. Anonymous FTP often uses 'anonymous' as username with empty or email as password
3. Directory permissions might allow browsing of sensitive folders even with anonymous access

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
