# Unprotected FTP Access Challenge

## Description
An FTP server has been improperly configured, leaving it vulnerable to unauthorized access. Your goal is to exploit this misconfiguration to access the server and retrieve the flag stored as `flag.txt`.

## Learning Objectives
- Understand basic FTP server configurations
- Recognize common FTP misconfigurations
- Practice exploiting weak FTP access controls

## Setup Instructions
1. Run `docker-compose up` to start the challenge environment.
2. Access the FTP server using the given credentials.
3. Retrieve the flag from the server.

## Target Information
- **Victim Container**: Hostname `victim`, FTP Service running on the private network at `172.20.0.10`
- **Attacker**: Access Kali Linux GUI through a web browser and use it to attack the challenge.

## Hints
- Try connecting to the FTP server using basic FTP commands.
- The username and password may be simpler than you think.
- Look for files that might contain sensitive information, such as the flag.
