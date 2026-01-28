# corporate-data-breach

## Description
A corporate server has been compromised and sensitive data may be exposed through multiple network services. Your task is to identify vulnerabilities, gain access to the system, and retrieve the confidential flag containing critical business information.

## Scenario
You are a penetration tester hired by SecureCorp to assess their network security. Intelligence suggests that their file server may have misconfigurations that could allow unauthorized access. The server runs multiple services and contains sensitive corporate data. Your goal is to identify and exploit these vulnerabilities to demonstrate the security risks.

## Difficulty
medium

## Machines
- **corporate-server** (victim): 172.25.145.22 - ftp, ssh
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Start with a comprehensive port scan to identify all running services
2. Some FTP servers allow anonymous access - check if you can login without credentials
3. Look for common weak credentials on SSH services, especially admin accounts
4. Once you gain initial access, explore the system for sensitive files and directories

## Flag Format
CTF{c0rp0r4t3_d4t4_br34ch_2024}
