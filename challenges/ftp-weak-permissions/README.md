# FTP Weak Permissions Challenge

## Learning Objectives
- Understand the risks associated with weak file permissions on FTP servers.
- Learn how to exploit misconfigured FTP servers to gain unauthorized access to sensitive files.

## Scenario
A small startup is using an FTP server to share files internally. However, due to misconfigurations and weak permissions, their files are vulnerable to unauthorized access. Your task is to exploit these weaknesses and retrieve the sensitive information stored on the server.

## Accessing the Challenge
- Use the Kali Linux GUI to connect to the FTP server at `ftp://172.25.0.10`
- Username: `user`
- Password: `pass123`

## Hints
1. Explore the directories exposed by the FTP server for misconfigured permissions.
2. Look into the `/srv/ftp/` directory for sensitive files accessible to anonymous users.
3. Check the file permissions to find any that are unexpectedly readable.
