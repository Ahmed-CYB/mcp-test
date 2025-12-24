# Weak FTP Permissions

## Scenario
Your task is to find the flag stored on an FTP server with weak permissions. The server runs anonymously, and you must navigate the file structure to locate the flag.

## Learning Objectives
- Learn about common FTP server misconfigurations
- Understand how to exploit anonymous FTP access

## Access
- Use Kali Linux to connect to the FTP server at `ftp://victim`

## Hints
1. Try connecting to the FTP server using anonymous access.
2. Look for files that are accessible to the anonymous user.
3. Check directories for readable files.