# Insecure FTP Configuration Challenge

## Learning Objectives
- Understand the security implications of FTP configurations
- Learn how to exploit misconfigured FTP servers
- Use common tools to interact with FTP services

## Challenge Details
A small company has set up an FTP server that allows anonymous access. Due to misconfigurations, sensitive information is available to unauthorized users. Your task is to exploit the server and retrieve the flag stored in the FTP directory.

## Accessing the Challenge
- Start the challenge using Docker Compose.
- Use the Kali Linux container to connect to the victim FTP server at `ftp://victim`.

## Hints
1. Consider how FTP configurations might allow unauthorized access.
2. Check if you can access the server anonymously.
3. Explore the FTP directory structure to find sensitive files.
