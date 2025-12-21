# Unsecured FTP and SSH Challenge

## Overview

A tech company has an FTP server that also allows SSH access. Due to misconfigurations, both services expose sensitive data. Your goal is to explore the FTP server, identify weaknesses, and leverage SSH to uncover the flag.

## Learning Objectives
- Understand FTP and SSH misconfigurations
- Explore the implications of weak credentials
- Practice pivoting between services

## Accessing the Victim
- Use Kali Linux to connect to the FTP server at `ftp://victim`
- SSH access is available on `victim` via port 22

## Running the Challenge
To deploy the challenge, run:
```
docker-compose up --build
```

## Hints
1. Check the FTP server for any sensitive files.
2. Use the provided weak credentials to access SSH.
3. Consider the implications of writable directories.
