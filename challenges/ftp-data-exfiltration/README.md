# ftp-data-exfiltration

## Description
A company's FTP server has been misconfigured, allowing unauthorized access to sensitive data. Your task is to identify the FTP service, exploit the misconfiguration to gain access, and retrieve the classified information hidden within the server's directory structure.

## Scenario
During a penetration test of TechCorp's network infrastructure, you've discovered an FTP server running on the target machine. Initial reconnaissance suggests the server may have been hastily configured with weak security settings. The system administrator mentioned that classified project files are stored somewhere on the FTP server, but access should be restricted. Your goal is to exploit any misconfigurations to access these files and retrieve the flag containing sensitive project information.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.20.145.3 - ssh
- **victim** (victim): 172.20.145.68 - ftp, ssh
## Victim credentials
- **victim**: `runner` / `p@ssw0rd`

## Hints
1. Start by scanning the target to identify running services and their versions
2. FTP servers often allow anonymous access - try connecting without credentials
3. Explore the directory structure thoroughly - sensitive files might be in subdirectories

## Flag Format
CTF{...}

