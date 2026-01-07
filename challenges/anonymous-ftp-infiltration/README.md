# anonymous-ftp-infiltration

## Description
A corporate FTP server has been misconfigured to allow anonymous access. Your task is to exploit this misconfiguration to retrieve sensitive company documents and find the hidden flag.

## Scenario
TechCorp Inc. has recently set up an FTP server to share public documentation with their clients. However, a system administrator made a critical error in the configuration, allowing anonymous users to access restricted areas of the server. Intelligence suggests that sensitive financial reports are stored on this server. Your mission is to exploit the anonymous FTP access to navigate through the directory structure and locate the classified documents containing the flag.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.145.176 - ftp
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Some FTP servers allow connections without authentication credentials.
2. Anonymous FTP access might grant you more permissions than intended by the administrator.
3. Corporate servers often have multiple directory structures - some might be more accessible than others.
4. Financial documents are typically stored in directories with names like 'confidential', 'reports', or 'classified'.

## Flag Format
CTF{4n0nym0u5_ftp_1s_d4ng3r0u5_2024}
