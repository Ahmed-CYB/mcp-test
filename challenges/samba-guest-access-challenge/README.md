# samba-guest-access-challenge

## Description
A corporate file server is running Samba with misconfigured guest access. Your task is to enumerate the SMB shares, identify accessible shares, and retrieve sensitive information that has been inadvertently exposed through weak access controls.

## Scenario
TechCorp recently deployed a new file server running Samba to share documents across departments. The system administrator configured the server quickly to meet a deadline but may have left some security gaps. As a penetration tester, you've been hired to assess the security of their file sharing infrastructure. Your goal is to identify any misconfigurations that could lead to unauthorized data access.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.26.145.63 - samba, ssh
- **attacker** (attacker): 172.26.145.3 - 

## Hints
1. Start by scanning the target for SMB services and identifying open ports
2. Try enumerating SMB shares without authentication - some may allow guest access
3. Look for shares that allow both browsing and read access for anonymous users
4. The flag might be in a share that appears to require authentication but actually allows guest access

## Flag Format
CTF{samba_guest_access_pwned}
