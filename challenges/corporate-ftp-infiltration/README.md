# corporate-ftp-infiltration

## Description
TechCorp's internal FTP server contains sensitive project files. The server appears to have multiple security misconfigurations that could allow unauthorized access. Your mission is to identify these vulnerabilities, gain access to the FTP server, and retrieve the confidential flag hidden within the file system.

## Scenario
You are conducting a penetration test for TechCorp, a software development company. During reconnaissance, you discovered an FTP server running on their internal network. The system administrator mentioned that the server hosts project documentation and source code backups. Intelligence suggests that a critical project file containing sensitive information is stored somewhere on this server. Your task is to exploit FTP misconfigurations to gain access and locate the hidden flag.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.193.141 - ftp
- **attacker** (attacker): 172.25.193.3 - 

## Hints
1. Start by scanning for open ports and services on the target machine
2. FTP servers sometimes allow anonymous access - try common anonymous login methods
3. Explore the directory structure thoroughly - sensitive files might be nested in subdirectories
4. Look for directories with names suggesting confidential or classified content

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
