# ssh-brute-force-corporate-breach

## Description
A corporate server has been configured with weak SSH credentials. Your task is to perform a brute force attack to gain unauthorized access and retrieve the confidential flag.

## Scenario
TechCorp's development server has been hastily configured with default SSH settings. The system administrator used a common username and a weak password from a standard wordlist. Intelligence suggests the server contains sensitive project files. Use brute force techniques to gain access and locate the hidden flag.

## Difficulty
medium

## Machines
- **techcorp-dev-server** (victim): 172.29.145.89 - ssh
- **attacker** (attacker): 172.29.145.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Common usernames in corporate environments include: admin, administrator, developer, user, test
3. Try using popular password lists like rockyou.txt or common passwords like password123, admin2024, test123

## Flag Format
CTF{br0t3_f0rc3_m4st3r_2024}
