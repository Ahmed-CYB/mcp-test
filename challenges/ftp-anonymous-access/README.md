# FTP Anonymous Access Challenge

## Description
Acme Corp has accidentally left their FTP server open for anonymous access. Your goal is to exploit this misconfiguration to retrieve a sensitive document.

## Learning Objectives
- Understand FTP service configuration and common misconfigurations.
- Learn how to exploit anonymous access in FTP servers.

## Accessing the Challenge
- Launch the provided Docker setup.
- Use the Kali Linux container to access the victim FTP service at hostname `victim` on port `21`.
- Retrieve the flag from the FTP server.

## Hints
- Try connecting to the FTP server using anonymous credentials.
- Look for files that might contain sensitive information.
