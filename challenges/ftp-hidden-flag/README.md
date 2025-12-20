# FTP Hidden Flag

## Description
An employee inadvertently left sensitive data on a public FTP server. Your task is to connect to this server using an FTP client and retrieve the hidden flag.

## Learning Objectives
- Understand basic FTP server setup
- Learn to use common FTP commands
- Practice searching hidden directories on FTP servers

## Deployment
Run `docker-compose up` to start the challenge environment. Connect to the FTP server at `victim:2121` using an FTP client from the attacker machine.

## Hints
1. Check for hidden directories or files on FTP servers.
2. Use FTP commands like `ls` and `cd` to explore the server.
3. Look for files with unusual permissions or those that might be hidden.
