# corporate-ftp-breach

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to identify the vulnerability, gain access to the FTP server, and retrieve the confidential flag containing customer information.

## Scenario
TechCorp Inc. recently set up an FTP server for file sharing between departments. The system administrator configured the server hastily before going on vacation. Security reports indicate potential unauthorized access to the file server. As a penetration tester, you need to assess the FTP server's security and retrieve any sensitive information that might be exposed.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.209.97 - ftp

## Hints
1. Not all FTP servers require authentication - some allow guest access
2. Corporate file servers often organize data in logical directory structures
3. The most sensitive information is usually stored in appropriately named directories

## Flag Format
CTF{4n0nym0u5_ftp_1s_d4ng3r0u5_2024}
