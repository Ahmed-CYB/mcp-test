# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured, allowing anonymous access to sensitive directories. Your task is to identify the vulnerabilities, gain access to the system, and retrieve the confidential flag hidden in the server's file structure.

## Scenario
TechCorp recently deployed an FTP server for file sharing between departments. However, the system administrator made several configuration mistakes that expose sensitive company data. As a penetration tester, you need to identify these vulnerabilities and demonstrate how an attacker could access confidential information.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.145.135 - ftp
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Start by scanning the target to identify open services and their versions
2. Check if the FTP server allows anonymous login - this is a common misconfiguration
3. Explore the directory structure thoroughly - sensitive files might be stored in subdirectories
4. Look for directories with write permissions that might contain uploaded confidential data

## Flag Format
CTF{ftp_m1sc0nf1g_3xp0s3d_s3cr3ts}
