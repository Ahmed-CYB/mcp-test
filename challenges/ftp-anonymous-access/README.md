# FTP Anonymous Access Challenge

## Learning Objectives
- Understand FTP service configuration and common misconfigurations
- Learn how anonymous FTP access can lead to sensitive data exposure
- Practice exploiting an FTP server with open anonymous access

## Challenge Description
A small company has set up an FTP server for file sharing among employees. However, due to misconfigured permissions, the server allows anonymous access, exposing sensitive data. Your task is to exploit this vulnerability and retrieve a confidential file.

## Access Details
- Attacker machine can be accessed through a VNC interface using Kali Linux.
- The FTP server is located at `172.25.0.10`.

## Hints
1. Try connecting to the FTP server using anonymous login.
2. Explore the directories available on the FTP server.
3. Locate and read the flag file.

## Flag
Retrieve the flag by accessing the server and find the file containing the flag in the public directory.
