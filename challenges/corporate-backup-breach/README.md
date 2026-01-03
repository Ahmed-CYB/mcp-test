# corporate-backup-breach

## Description
A corporate server runs multiple services for internal operations. Intelligence suggests they use weak authentication practices and have sensitive backup files accessible through their file sharing services. Your mission is to infiltrate their network and retrieve the confidential project files.

## Scenario
TechCorp Industries runs a Linux server that provides FTP and SSH access for their employees. Recent security audits revealed they may be using default credentials and have misconfigured their FTP service to allow anonymous access to certain directories. As a penetration tester, you need to identify vulnerabilities and extract sensitive information from their backup systems.

## Difficulty
medium

## Machines
- **techcorp-server** (victim): 172.24.193.47 - ftp, ssh
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Corporate environments often have multiple services running - enumerate all open ports first
2. Anonymous FTP access might reveal interesting information about the system and other services
3. Look for files that might contain hints about credentials or system configuration
4. The backup directory structure might not be immediately visible - explore the FTP filesystem carefully

## Flag Format
CTF{c0rp0r4t3_b4ckup5_4r3_n0t_s3cur3}
