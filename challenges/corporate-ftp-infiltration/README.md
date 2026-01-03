# corporate-ftp-infiltration

## Description
A corporate FTP server appears to have weak security configurations. The company stores sensitive documents on their FTP server, but rumor has it that some accounts have default credentials and there might be hidden directories containing confidential information.

## Scenario
You've discovered a corporate FTP server during a penetration test. Initial reconnaissance suggests the server might have multiple user accounts with varying access levels. Your goal is to gain access to the server and locate sensitive corporate documents that contain the flag.

## Difficulty
medium

## Machines
- **corporate-ftp-server** (victim): 172.23.208.188 - ftp

## Hints
1. Start with a port scan to identify running services
2. Try anonymous FTP access first, then look for user accounts
3. Some administrators use very simple passwords for convenience
4. Hidden directories often start with a dot (.)

## Flag Format
CTF{ftp_br34ch_succ3ssful_2024}
