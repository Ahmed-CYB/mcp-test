# corporate-file-infiltration

## Description
A corporate file server runs both FTP and Samba services for different departments. Intelligence suggests that sensitive financial data is stored on this server, but access controls may not be properly configured. Your mission is to infiltrate the system and retrieve the confidential budget report.

## Scenario
You've discovered a corporate file server (192.168.1.100) that appears to be running multiple file sharing services. The company uses FTP for public file transfers and Samba for internal Windows file sharing. Your reconnaissance shows both services are active, but you need to find a way to access restricted areas where confidential documents are stored.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.24.193.184 - ftp, samba
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Multiple services often mean multiple attack vectors - scan thoroughly
2. Anonymous access doesn't always mean you can see everything immediately
3. Some Samba shares might not be browseable but could still be accessible
4. The finance directory exists but requires the right approach to access

## Flag Format
CTF{samba_null_sessions_are_dangerous_af7b3c9d}
