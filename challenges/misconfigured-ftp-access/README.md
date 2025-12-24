# Misconfigured FTP Access

## Learning Objectives
- Understand how FTP services can be misconfigured
- Learn to exploit misconfigurations for unauthorized file access
- Practice using FTP clients from Kali Linux to access the server

## Challenge Description
An organization has set up an FTP server to allow employees to share files securely. However, due to misconfigurations, sensitive information can be accessed without proper authentication. The challenge is to exploit this misconfiguration to retrieve the flag from the server.

## Deployment
1. Use the provided `docker-compose.yml` to start the challenge environment.
2. Access the FTP server from Kali Linux using the hostname `ftpserver`.
3. Find and retrieve the flag from the FTP server.

## Accessing the Challenge
- Start the attacker container using Docker Compose.
- Use a web browser to access the Kali Linux desktop on port 6901.
- The default VNC password is `password`.

## Hints
1. Review the FTP server's user access and authentication settings.
2. Consider using anonymous FTP login to explore accessible directories.
3. Search for the `flag.txt` file within the accessible directories.