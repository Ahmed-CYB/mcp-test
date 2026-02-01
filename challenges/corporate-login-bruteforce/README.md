# corporate-login-bruteforce

## Description
A corporate server has been misconfigured with weak SSH credentials. Use brute force techniques to gain access and retrieve sensitive information.

## Scenario
You are conducting a penetration test for TechCorp Industries. Intelligence suggests that their development server at 192.168.1.100 uses weak SSH credentials for multiple user accounts. Your task is to identify valid credentials through brute force attacks and locate the flag containing sensitive project information.

## Difficulty
medium

## Machines
- **techcorp-dev-server** (victim): 172.23.145.60 - ssh
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. Start with network reconnaissance to identify open services and potential attack vectors.
2. The server has multiple user accounts with predictable naming conventions - try common usernames like admin, developer, testuser.
3. Use a brute force tool like Hydra with a common password wordlist - the passwords follow simple patterns like username123 or common defaults.

## Flag Format
CTF{br0k3n_p4ssw0rd5_4r3_d4ng3r0u5}
