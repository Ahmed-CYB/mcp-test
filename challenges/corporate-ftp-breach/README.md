# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to identify the vulnerability, gain access to the FTP server, and retrieve the confidential flag hidden in the restricted directories.

## Scenario
TechCorp's IT department recently set up an FTP server for file sharing between departments. However, due to rushed deployment and inadequate security review, the server contains multiple misconfigurations that could allow unauthorized access. As a penetration tester, you've been hired to assess the security of this FTP service and demonstrate potential data breaches.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.29.145.24 - ftp
- **attacker** (attacker): 172.29.145.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Check if anonymous FTP access is enabled - this is a common misconfiguration
3. Look for credential files or user information that might be accessible through FTP
4. Some directories might have different permission levels - explore thoroughly

## Flag Format
CTF{ftp_m1sc0nf1gur4t10n_l34ds_t0_d4t4_br34ch}
