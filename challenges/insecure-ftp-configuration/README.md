# Insecure FTP Configuration Challenge

## Learning Objectives
- Understand the implications of enabling anonymous FTP access.
- Explore common FTP misconfigurations.
- Practice exploiting weak FTP configurations to gain unauthorized access.

## Scenario
A legacy FTP server is used by a company for sharing documents internally. The server configuration allows anonymous access, exposing sensitive files. Your task is to investigate the server and retrieve the hidden flag.

## Environment
- Use Kali Linux to connect to the FTP server at: ftp://victim:21
- You can access Kali Linux GUI through http://localhost:6901 with password 'password'.

## Goal
Find the flag by exploring the anonymous FTP server setup.

## Deployment
Run `docker-compose up --build` to start the challenge environment.
