# Insecure FTP Configuration

## Scenario
A company has configured an FTP server using default settings, which exposes sensitive files to unauthorized users. As an attacker, your task is to exploit the misconfiguration to retrieve the flag stored in a text file.

## Learning Objectives
- Understand common FTP server misconfigurations
- Exploit weak FTP credentials
- Learn about FTP command-line tools

## Setup Instructions
1. Start the challenge using `docker-compose up -d`.
2. Access the Kali Linux desktop at `http://localhost:6901` with the password `password`.
3. Use your penetration testing skills to access the FTP server hosted at `ftpserver` (172.25.0.10).

## Hints
1. Check for common FTP credentials.
2. Understand how FTP directory permissions might expose critical files.
3. Use tools available in Kali Linux to connect and explore the FTP server.