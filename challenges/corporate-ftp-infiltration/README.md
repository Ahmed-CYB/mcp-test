# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured allowing unauthorized access. The server contains sensitive financial data that needs to be retrieved. Multiple attack vectors exist including anonymous access and credential-based exploitation.

## Scenario
You are conducting a penetration test for TechCorp Industries. Their FTP server at 192.168.1.100 is suspected of having security vulnerabilities. Your task is to gain access to the server and retrieve the confidential quarterly report containing sensitive financial data.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.145.22 - ftp
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start with a port scan to identify running services on the target
2. Check if anonymous FTP access is enabled - some servers allow guest access
3. Look for common FTP credentials like admin:admin, ftp:ftp, or user:password combinations
4. The confidential directory might contain the sensitive data you're looking for

## Flag Format
CTF{ftp_m1sc0nf1g_3xp0s3d_d4t4}
