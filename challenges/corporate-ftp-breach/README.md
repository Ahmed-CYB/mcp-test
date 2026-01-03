# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured and may contain sensitive information. Your task is to identify vulnerabilities in the FTP service and retrieve the confidential flag hidden within the system.

## Scenario
TechCorp recently deployed an FTP server for file sharing between departments. The system administrator made several configuration mistakes that could allow unauthorized access to sensitive corporate data. As a security consultant, you need to assess the FTP service and demonstrate how an attacker could gain access to confidential information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.156 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Not all FTP servers require authentication to browse directories
2. Some FTP configurations allow both anonymous and authenticated access with different privileges
3. Corporate file structures often follow predictable naming conventions

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
