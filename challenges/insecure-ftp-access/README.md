# Insecure FTP Access

## Learning Objectives
- Understand the risks of exposing FTP services to the internet
- Learn to identify and exploit unprotected FTP servers
- Retrieve sensitive information using basic FTP commands

## Scenario
A new company file server is accidentally exposed to the internet. Your task is to access the server via anonymous FTP login and retrieve sensitive information.

## Instructions
1. Deploy the challenge using the provided `docker-compose.yml`.
2. Use the Kali Linux attacker environment to connect to the FTP server.
3. Access the FTP server using anonymous login and retrieve the `flag.txt` file located in the root directory.

Access the victim server at `ftp://172.25.0.10`.
