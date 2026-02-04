# ftp-directory-traversal-medium

## Description
A misconfigured FTP server allows anonymous access and contains sensitive files in various directories. Your goal is to explore the FTP server, identify security weaknesses, and retrieve the hidden flag.

## Scenario
During a penetration test, you've discovered an FTP server running on the target network. The system administrator has enabled anonymous access for file sharing but may have misconfigured directory permissions. Investigate the FTP service to find sensitive information and capture the flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **ftp-server** (victim): 172.25.145.47 - ftp, ssh

## Hints
1. Start by scanning the target to identify open services and their versions
2. Anonymous FTP access might be enabled - try connecting without credentials
3. Explore all available directories thoroughly, some might contain hidden subdirectories

## Flag Format
CTF{...}
