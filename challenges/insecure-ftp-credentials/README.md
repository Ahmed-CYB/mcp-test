# Insecure FTP Credentials Challenge

## Learning Objectives
- Understand weak credential management and its risks
- Learn to conduct basic brute force attacks
- Explore FTP server configuration and its vulnerabilities

## Description

A small company has set up an FTP server to share files among employees. Unfortunately, they have used weak credentials for login. Your task is to exploit this weakness, gain access to the FTP server, and retrieve the flag stored in `flag.txt`.

## Access

Use the Kali Linux container to perform attacks on the FTP server running in the victim container at `ftp://victim:21`.

## Hints
1. Think about default or weak passwords that might be used.
2. Explore tools like Hydra to automate password attempts.
3. The username might be `ftpuser`.