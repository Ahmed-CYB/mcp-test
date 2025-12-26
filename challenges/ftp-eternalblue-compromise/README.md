# FTP and EternalBlue Compromise

## Learning Objectives
- Understand and exploit FTP misconfigurations
- Recognize and exploit the EternalBlue vulnerability

## Challenge Description
You will encounter two machines:
1. A machine running an FTP server with misconfigured anonymous access.
2. A machine vulnerable to the EternalBlue exploit.

Your task is to exploit the FTP server to retrieve sensitive information and use the EternalBlue vulnerability to gain control over the second machine.

Access your attack environment via the Kali Linux instance provided.

## Instructions
- Use the Kali instance to explore and exploit the vulnerabilities.
- FTP Victim is accessible at `ftp-victim` (IP: 172.21.0.10).
- EternalBlue Victim is accessible at `eternalblue-victim` (IP: 172.21.0.20).

## Hints
1. Start by probing the FTP server for accessible files.
2. Recall how EternalBlue exploits the SMB service; Metasploit might be useful.
3. Look for sensitive files on the FTP server that could help with your EternalBlue attack.

## Flag
Retrieve the flag from `/home/user/flag.txt` on the EternalBlue-vulnerable machine.

