# Unsecured FTP Access

## Learning Objectives
- Understand basic FTP operations
- Explore anonymous FTP access
- Practice navigating and retrieving files over FTP

## Description
An unsecured FTP server is available on the network. Your task is to connect to it and search for the hidden flag file. This challenge is designed to teach the basics of FTP access and file retrieval over an insecure setup.

## Accessing the Challenge
- Start the docker-compose setup to initiate the victim (FTP server) and attacker (Kali Linux) containers.
- Use the Kali Linux environment to connect to the FTP server at `ftp://victim`.
- The flag is located somewhere on the server.

## Tips
- Use standard FTP commands to navigate the server.
- The server allows anonymous access; no password is needed.
- Check for any hidden files or directories.
