# corporate-ftp-infiltration

## Description
A corporate FTP server has been discovered with multiple security misconfigurations. The server allows anonymous access and has been poorly configured by the system administrator. Your task is to identify the vulnerabilities, gain access to the system, and retrieve the confidential flag hidden in the file system.

## Scenario
During a penetration test of Acme Corp's network infrastructure, you've discovered an FTP server running on their internal network. Initial reconnaissance suggests the server may have been hastily configured with default settings. The system administrator appears to have enabled anonymous access for temporary file sharing but forgot to properly secure the server. Intelligence suggests that sensitive corporate data, including access credentials and project files, may be stored on this server.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.25.145.47 - ftp
- **attacker** (attacker): 172.25.145.3 - 

## Hints
1. Start with a port scan to identify running services and their versions
2. FTP servers often allow anonymous login - try common anonymous credentials
3. Explore the directory structure thoroughly - administrators sometimes hide sensitive files in unexpected locations
4. Pay attention to file permissions and directory access rights - misconfigurations can lead to information disclosure

## Flag Format
CTF{ftp_4n0nym0us_4cc3ss_c0mpr0m1s3d}
