# samba-anonymous-shares

## Description
A corporate file server is running Samba with misconfigured shares. Anonymous access has been accidentally enabled on sensitive directories. Your task is to enumerate the SMB shares, identify accessible directories, and retrieve the confidential flag file.

## Scenario
TechCorp recently migrated their file server to a new Linux-based system running Samba. During the migration, the system administrator made several configuration mistakes that left sensitive shares accessible to anonymous users. As a penetration tester, you need to identify these misconfigurations and access the confidential data.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.21.193.69 - samba, ssh
- **attacker** (attacker): 172.21.193.3 - 

## Hints
1. Start by scanning for SMB services and identifying available shares
2. Some shares might be hidden from the browse list but still accessible
3. Anonymous access might be enabled - try connecting without credentials
4. Check the backup share for information about other shares that might exist

## Flag Format
CTF{smb_anonymous_access_is_dangerous}
