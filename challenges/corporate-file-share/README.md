# corporate-file-share

## Description
A corporate file server is running Samba with weak security configurations. The IT department has been careless with permissions and user management. Your task is to gain unauthorized access to sensitive company documents and retrieve the confidential flag.

## Scenario
TechCorp Inc. recently set up a Linux-based file server using Samba to share documents across departments. The system administrator configured it quickly without following security best practices. Anonymous access is disabled, but there are multiple user accounts with varying privilege levels. Intelligence suggests that one of the accounts has weak credentials and there might be sensitive files accessible through network shares.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.23.212.88 - samba

## Hints
1. SMB services often have multiple user accounts with different access levels
2. Look for configuration files that might contain credential information
3. The admin account might have access to hidden or restricted shares

## Flag Format
CTF{samba_shares_need_proper_security_controls}
