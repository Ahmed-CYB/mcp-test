# corporate-ftp-infiltration

## Description
A corporate FTP server appears to have weak security configurations. Your mission is to infiltrate the server and retrieve sensitive financial documents that contain the flag. The server uses vsftpd with custom configurations that may have security implications.

## Scenario
During a penetration test of Apex Financial Corp, you've discovered an FTP server running on their internal network. Initial reconnaissance suggests the server might be misconfigured, potentially allowing unauthorized access to confidential financial reports. Your goal is to gain access and locate the quarterly earnings report containing sensitive information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.23.210.147 - ftp

## Hints
1. Not all FTP servers require authentication - some allow guest access
2. Anonymous FTP might be enabled - try connecting without credentials using 'anonymous' as username
3. Once connected, explore the directory structure thoroughly - sensitive data might be in subdirectories

## Flag Format
CTF{4n0nym0us_ftp_1s_d4ng3r0us_2024}
