# ftp-anonymous-data-breach

## Description
A corporate file server has been configured with FTP for file sharing, but poor security practices have left sensitive data exposed. The administrator enabled anonymous access and created writable directories without proper access controls. Your mission is to discover and extract confidential information from the vulnerable FTP server.

## Scenario
TechCorp Inc. recently set up an FTP server to facilitate file sharing between departments. The system administrator, rushing to meet a deadline, configured the server with anonymous access enabled and created several directories for different departments. However, they made critical security mistakes that exposed sensitive company data. As a penetration tester, you need to identify these vulnerabilities and retrieve the confidential information.

## Difficulty
medium

## Machines
- **ftp-victim** (victim): 172.26.145.159 - ftp, ssh
- **attacker** (attacker): 172.26.145.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions.
2. Anonymous FTP access might be enabled - try connecting without credentials.
3. Explore the directory structure thoroughly - sensitive data might be stored in unexpected locations.
4. The HR department folder might contain confidential information that shouldn't be publicly accessible.

## Flag Format
CTF{ftp_4n0nym0us_4cc3ss_1s_d4ng3r0us}
