# corporate-file-share

## Description
A corporate file server is running an SMB service with weak security configurations. Your goal is to enumerate the shares, find accessible directories, and retrieve the sensitive flag file.

## Scenario
You are conducting a penetration test for CyberCorp Industries. During your network reconnaissance, you discovered an SMB file server at 192.168.1.100. The system administrator has configured the Samba service but made several security mistakes that allow unauthorized access to sensitive company files.

## Difficulty
easy

## Machines
- **fileserver** (victim): 172.23.210.45 - samba, ssh
- **attacker** (attacker): 172.23.210.3 - 

## Hints
1. Start with a port scan to identify running services on the target
2. SMB services often allow anonymous or guest access - try listing shares without credentials
3. Look for publicly accessible shares and explore their directory structure thoroughly

## Flag Format
CTF{smb_anonymous_access_is_dangerous}
