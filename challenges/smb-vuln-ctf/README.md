# SMB Vulnerability CTF Challenge

## Objective

Welcome to the SMB Vulnerability CTF Challenge! Your goal is to exploit a simulated SMB vulnerability and find the hidden flag within the system.

## Description

This challenge is designed to test your skills in identifying and exploiting an SMB vulnerability. You'll be working in a controlled environment that mimics a vulnerable SMB service.

## Rules

- Please do not attack the infrastructure itself.
- Do not share the flag or write-ups publicly before the challenge is over.
- This challenge is for educational purposes only.

## Setup Instructions

1. Ensure Docker is installed on your machine.
2. Build the Docker image using the provided `Dockerfile`.
   ```
   docker build -t smb-vuln-challenge .
   ```
3. Run the Docker container.
   ```
   docker run -d -p 445:445 smb-vuln-challenge
   ```

## Hints

- Pay attention to SMB share configurations.
- Look for common configuration mistakes in SMB services.

Good luck, and happy hacking!