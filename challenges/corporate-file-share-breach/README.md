# corporate-file-share-breach

## Description
A corporate file server is running an outdated Samba configuration with weak security settings. The server contains sensitive financial documents that need to be accessed. Your task is to enumerate the SMB shares, find valid credentials, and retrieve the confidential flag.

## Scenario
You've been hired to perform a security assessment of TechCorp's internal file server. The server is known to run Samba for file sharing among employees. Intelligence suggests that the system administrator has been careless with security configurations and may have left default or weak credentials in place. Your goal is to gain access to the financial department's shared folder and retrieve sensitive information.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.25.193.86 - samba
- **attacker** (attacker): 172.25.193.3 - 

## Hints
1. Start by scanning for open SMB ports and enumerating available shares
2. Some shares might allow anonymous access - check what files are publicly readable
3. Look for any documentation or policy files that might contain credential information
4. The finance department might have predictable password patterns related to their work

## Flag Format
CTF{samba_shares_need_proper_security_2024}
