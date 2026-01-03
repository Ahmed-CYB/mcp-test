# corporate-data-breach

## Description
A corporate FTP server has been compromised and sensitive data may be accessible. The server appears to have weak authentication and potential misconfigurations that allow unauthorized access to classified documents.

## Scenario
TechCorp's internal FTP server (192.168.1.100) was recently flagged by the security team for suspicious activity. Intelligence suggests that weak credentials and FTP misconfigurations may allow attackers to access sensitive corporate data. Your mission is to investigate the FTP service, gain unauthorized access, and retrieve the classified flag containing proof of the data breach.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.75 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Start with a port scan to identify running services
2. FTP servers often allow anonymous access - try logging in without credentials first
3. If anonymous access is restricted, consider that backup accounts often use predictable passwords

## Flag Format
CTF{ftp_br34ch_d3t3ct3d_2024}
