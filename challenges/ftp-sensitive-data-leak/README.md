# FTP Sensitive Data Leak

## Scenario
A small business has accidentally exposed sensitive internal documents on their FTP server. Your mission is to examine the server to discover and retrieve the document that contains the flag.

## Learning Objectives
- Understand the risks associated with misconfigured FTP servers
- Learn how to navigate FTP services to find sensitive data
- Practice using FTP client tools to interact with an FTP server

## Access Instructions
You can attack the FTP server from the Kali Linux container provided in this challenge. The FTP server is available at `ftp://victim`.

## Starting the Challenge
1. Deploy the challenge using Docker Compose.
2. Use FTP tools from the Kali Linux environment to connect to the server at `ftp://victim`.
3. Search through the server to find the `flag.txt` file.

## Hints
1. Start by connecting to the FTP server using anonymous login.
2. Look for any files that might seem out of place or sensitive.
3. Remember that FTP often has default directories that might contain important information.
