# corporate-breach-eternalblue

## Description
A corporate file server running an outdated Samba service is vulnerable to the infamous EternalBlue exploit (MS17-010). The vulnerability exists in SMBv1 protocol implementation, allowing remote code execution without authentication. Your mission is to exploit this vulnerability to gain access to the system and retrieve sensitive corporate data.

## Scenario
TechCorp's file server hasn't been updated in months and is running a vulnerable version of Samba with SMBv1 enabled. Security audits have been postponed, leaving critical vulnerabilities unpatched. As a penetration tester, you've been hired to demonstrate the severity of this oversight. The server contains classified project files that must be secured immediately.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.24.193.45 - samba, ssh
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. The server is running an outdated file sharing service. Network scanning might reveal interesting ports.
2. SMBv1 protocol has known critical vulnerabilities. Check for MS17-010 specifically.
3. Metasploit has modules for exploiting Samba vulnerabilities. Look for 'is_known_pipename' module.
4. Once you gain access, look for classified project files in the Samba share directories.

## Flag Format
CTF{3t3rn4l_blu3_sm8_pwn3d_2024}
