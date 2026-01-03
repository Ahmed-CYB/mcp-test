# corporate-file-leak

## Description
A corporate file server has been misconfigured, allowing unauthorized access to sensitive documents. Your task is to enumerate the Samba shares, identify accessible directories, and retrieve the confidential flag file.

## Scenario
TechCorp's IT administrator hastily set up a new file server for the accounting department. Due to poor security practices, the Samba configuration contains vulnerabilities that allow anonymous access to certain shares. As a penetration tester, you need to identify these misconfigurations and access the sensitive financial data.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.25.194.198 - samba
- **attacker** (attacker): 172.25.194.3 - 

## Hints
1. SMB services often run on ports 139 and 445. Start with network scanning.
2. Some SMB configurations allow anonymous or guest access to shares.
3. The accounting share might contain sensitive subdirectories worth exploring.

## Flag Format
CTF{samba_shares_need_proper_security_controls}
