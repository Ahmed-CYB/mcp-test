# corporate-file-breach

## Description
A corporate file server running Samba has been misconfigured, allowing unauthorized access to sensitive company documents. Your task is to identify the vulnerability, gain access to the shared directories, and retrieve the confidential flag containing the CEO's password.

## Scenario
TechCorp's IT administrator hastily configured a new Samba file server for the finance department. In their rush to meet the deadline, they made several security oversights. The server is now live on the network, and you've been hired as a penetration tester to assess its security. Intelligence suggests that critical financial documents and executive credentials are stored on this server.

## Difficulty
medium

## Machines
- **samba-server** (victim): 172.23.211.72 - samba
- **attacker** (attacker): 172.23.211.3 - 

## Hints
1. Start by scanning the target to identify open ports and services
2. Samba servers often allow null sessions for enumeration - try connecting without credentials
3. Some shares might not be browseable but could still be accessible directly
4. Look for shares that allow guest access and check their contents thoroughly

## Flag Format
CTF{samba_null_session_pwned_2024}
