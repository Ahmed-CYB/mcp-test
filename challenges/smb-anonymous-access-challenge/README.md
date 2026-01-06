# smb-anonymous-access-challenge

## Description
A misconfigured Samba server allows anonymous access to shares containing sensitive information. Exploit the SMB service to retrieve the hidden flag from the accessible share.

## Scenario
During a penetration test, you discovered a Samba server that appears to allow anonymous connections. The initial reconnaissance shows a share named 'myshare' is available, but direct access seems to be failing. Investigate the SMB service configuration and find a way to access the sensitive data.

## Difficulty
medium

## Machines
- **smb-victim** (victim): 172.21.145.185 - samba, ssh
- **attacker** (attacker): 172.21.145.3 - 

## Hints
1. The SMB service allows anonymous connections, but you need to use the correct syntax
2. Try using smbclient with the proper UNC path format: //IP/sharename
3. Once connected anonymously, explore the directory structure to find hidden folders

## Flag Format
CTF{smb_anonymous_access_is_dangerous}
