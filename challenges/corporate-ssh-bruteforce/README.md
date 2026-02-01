# corporate-ssh-bruteforce

## Description
A corporate server has been configured with weak SSH credentials. Your task is to perform a brute force attack to gain unauthorized access and retrieve the sensitive flag file.

## Scenario
During a penetration test of CyberCorp's infrastructure, you've discovered an SSH service running on their development server. Intelligence suggests they use common usernames with weak passwords. Your goal is to brute force the SSH service and gain access to retrieve confidential data.

## Difficulty
medium

## Machines
- **dev-server** (victim): 172.27.145.61 - ssh
- **attacker** (attacker): 172.27.145.3 - 

## Hints
1. Start by scanning the target to identify which services are running
2. Common usernames in corporate environments include admin, developer, guest, and testuser
3. Try using Hydra for SSH brute force attacks with common password patterns
4. The flag is located in the developer's home directory under a confidential folder

## Flag Format
CTF{ssh_brute_f0rce_m4st3r_2024}
