# FTP Vulnerable File Disclosure

## Learning Objectives
- Understand FTP server misconfigurations
- Learn to enumerate FTP servers for publicly accessible files
- Practice accessing FTP services from a penetration testing perspective

## Scenario
A startup company uses an FTP server for file sharing internally. Unfortunately, the server is misconfigured to allow access to some sensitive files by unauthorized users. Your task is to find and download the flag file from the FTP server.

## Access Instructions
- Use the Kali Linux container to attack the FTP server at ftp://victim:21
- The FTP server is setup with anonymous access enabled.

## Hints
1. Enumerate the directory structure and look for hidden files.
2. Check file permissions carefully to see what can be accessed.
3. Use command-line FTP clients to interact with the server.
