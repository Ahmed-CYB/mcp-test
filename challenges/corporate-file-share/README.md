# corporate-file-share

## Description
A corporate file server is running an SMB service with suspicious configuration. Intelligence suggests sensitive documents are stored on shared drives with weak access controls. Your mission is to infiltrate the file server and retrieve the confidential flag.

## Scenario
TechCorp Industries uses a Linux-based Samba file server to share documents across departments. Recent security audits revealed potential misconfigurations in share permissions and user access controls. As a penetration tester, you need to identify and exploit these weaknesses to access restricted files containing sensitive corporate data.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.23.211.49 - samba

## Hints
1. SMB services often allow anonymous connections - try connecting without credentials
2. Some shares might not be browseable but could still be accessible directly
3. The 'guest ok = yes' parameter in SMB configuration can be exploited

## Flag Format
CTF{samba_null_session_pwned_2024}
