# FTP Dictionary Attack Challenge

## Scenario
An FTP server is running on an old legacy system with weak credentials. Your task is to perform a dictionary attack to find the correct username and password combination and retrieve the flag stored on the server.

## Learning Objectives
- Understand FTP protocol and common vulnerabilities
- Learn how to perform a dictionary attack on login credentials
- Practice using tools like Hydra for brute-forcing

## Access
Use the Kali Linux container to attack the victim container:
- Victim FTP server is accessible at `ftp://172.20.0.10`
- Run your attacks from the Kali container (`http://attacker:6901` with VNC password `password`)

## Hints
1. The FTP server uses a common username and a weak password.
2. Consider using a tool like Hydra to perform a dictionary attack.
3. The password is a simple lowercase word.