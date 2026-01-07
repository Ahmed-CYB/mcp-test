# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company documents. Your task is to identify the vulnerability, gain access to the server, and retrieve the confidential flag hidden within the corporate file structure.

## Scenario
TechCorp's IT department recently deployed a new FTP server for file sharing between departments. However, due to rushed deployment and inadequate security review, the server contains multiple misconfigurations that could allow unauthorized access. As a penetration tester, you've been tasked with identifying these vulnerabilities and demonstrating the potential for data exfiltration.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.145.31 - ftp
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Some FTP servers allow anonymous access without authentication - try common anonymous login combinations
3. Explore the directory structure thoroughly - corporate environments often have organized folder hierarchies

## Flag Format
CTF{ftp_m1sc0nf1g_l3ads_t0_d4ta_br3ach}
