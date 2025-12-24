# Easy FTP Misconfiguration

## Challenge Overview
A small company has set up an FTP server for file management and sharing. However, due to a misconfiguration, some sensitive files are exposed that should not be publicly accessible. Your task is to find and capture the flag hidden within the FTP server.

## Learning Objectives
1. Understand basic FTP operations.
2. Learn about common misconfigurations in FTP servers.
3. Practice accessing FTP servers using client tools.

## Access Instructions
- You will be attacking from the provided Kali Linux environment.
- The FTP server can be accessed at ftp://ftpserver (IP: 172.25.0.10).
- Use FTP client tools available on Kali Linux to connect and search for the flag.

## Hints
1. The FTP server uses default user credentials.
2. Look for files that seem out of place or sensitive.
3. The flag is in a text file within the home directory of the FTP user.
