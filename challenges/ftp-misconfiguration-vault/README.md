# FTP Misconfiguration Vault

## Learning Objectives
- Understand the security implications of misconfigured FTP servers.
- Explore a system for sensitive files and identify potential misconfigurations.
- Use basic FTP commands to explore and retrieve files from a server.

## Challenge Description
A small tech startup has set up an FTP server for internal file sharing. Due to a misconfiguration, it is possible to access sensitive files anonymously. Your mission is to investigate the FTP server running on 172.25.0.10 and retrieve the company's confidential flag file located somewhere on the server.

## Setup Instructions
- Ensure Docker and Docker Compose are installed on your system.
- Run `docker-compose up` to start the challenge environment.
- Access the Kali Linux desktop via your web browser (VNC password: password).
- Use any FTP client available in Kali to connect to the FTP server at `172.25.0.10`.

## Hints
1. Consider how FTP permissions might be misconfigured to allow unauthorized access.
2. Check if anonymous login is enabled on the FTP server.
3. Look for directories or files that should not be publicly accessible.