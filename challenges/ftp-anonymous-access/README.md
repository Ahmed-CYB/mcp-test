# FTP Anonymous Access

## Learning Objectives
- Understand FTP server misconfigurations
- Exploit anonymous access to find sensitive information

## Challenge Description
A small company's FTP server has been misconfigured to allow anonymous access without requiring a password. Your task is to find a way to exploit this misconfiguration to access the server and retrieve the hidden flag.

## Instructions
1. Access the FTP server from the Kali Linux attacker container.
2. Use the FTP anonymous login feature to explore the server.
3. Find and retrieve the flag from the '/srv/ftp/public' directory.

## Access Information
- FTP Server IP: 172.25.0.10
- Use anonymous login with any email as a password.

## Flag
Retrieve the flag by accessing the FTP server.

## Hints
1. Try connecting to the FTP server using anonymous login.
2. Look for directories and files that are publicly accessible.
3. The flag might be stored in a file that doesn't require special permissions to read.