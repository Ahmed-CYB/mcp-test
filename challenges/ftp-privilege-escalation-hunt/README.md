# ftp-privilege-escalation-hunt

## Description
You've successfully gained access to a victim machine through an FTP vulnerability. The system administrator has hidden the flag somewhere on the filesystem. Your task is to explore the system, escalate privileges if necessary, and locate the hidden flag. Use your knowledge of Linux file systems and privilege escalation techniques to complete this challenge.

## Scenario
During a penetration test, you've compromised an FTP server and gained initial access to the target system. The client has informed you that sensitive data (the flag) is stored somewhere on the server. You need to thoroughly investigate the system to find where the flag has been hidden. The system may have misconfigurations or weak security settings that can help you locate the flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.23.145.3 - ssh
- **victim** (victim): 172.23.145.59 - ftp, ssh
## Victim credentials
- **victim**: `service` / `welcome`

## Hints
1. You have FTP access - start by exploring what you can access on the system
2. Check what commands you can run with elevated privileges using 'sudo -l'
3. The flag might be in a location that requires root access - think about how to read files as root
4. Use 'sudo find' to search for files you normally couldn't access, then use 'sudo cat' to read them

## Flag Format
CTF{...}

