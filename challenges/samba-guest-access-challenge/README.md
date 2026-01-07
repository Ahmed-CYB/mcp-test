# samba-guest-access-challenge

## Description
A corporate file server running Samba has been misconfigured, allowing unauthorized access to sensitive data. Your mission is to exploit the Samba service to retrieve the hidden flag from the shared directories.

## Scenario
TechCorp's IT department recently set up a new file server running Samba to share documents across the organization. However, due to a configuration oversight, the server allows guest access to certain shares. As a penetration tester, you've been tasked with identifying and exploiting this vulnerability to demonstrate the security risk. The flag is hidden somewhere in the shared directories.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.26.145.164 - samba, ssh
- **attacker** (attacker): 172.26.145.3 - ssh

## Hints
1. Start by scanning the target for open ports and identifying the SMB service
2. Use enum4linux or smbclient to enumerate available shares on the target
3. Some shares might allow guest access even if they're not browseable
4. Try accessing shares with null authentication or as a guest user

## Flag Format
CTF{samba_guest_access_pwned}
