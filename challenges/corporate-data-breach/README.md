# corporate-data-breach

## Description
A corporate FTP server has been compromised and sensitive data may be exposed. Your task is to investigate the FTP service, identify vulnerabilities, and retrieve the confidential flag that contains evidence of the data breach.

## Scenario
TechCorp Industries recently experienced a security incident. Their FTP server, which was used for internal file transfers, is suspected to have been misconfigured. As a security consultant, you need to assess the FTP service running on their server (192.168.1.100) and recover any sensitive information that might have been exposed.

## Difficulty
medium

## Machines
- **techcorp-ftp-server** (victim): 172.23.208.168 - ftp

## Hints
1. Start by scanning the target to identify open services and their versions
2. Check if the FTP service allows anonymous access - no credentials might be needed
3. Look for interesting directories and files that might contain sensitive information
4. The evidence of the breach might be stored in a confidential location within the FTP structure

## Flag Format
CTF{ftp_4n0nym0us_d4t4_br34ch_3xp0s3d}
