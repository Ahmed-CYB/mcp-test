# Open FTP Anonymous Access

## Learning Objectives
- Understand how FTP servers can be misconfigured to allow anonymous access
- Explore the vulnerabilities associated with FTP

## Challenge Description
In this challenge, you'll discover a vulnerable FTP server configured to allow anonymous access. Your task is to connect to the server and find the hidden flag file.

## Accessing the Challenge
- Use the Kali Linux container in the CTF environment to connect to the FTP server.
- No credentials are required to connect as the server allows anonymous access.
- The FTP server is located on `172.20.0.10` and listens on the default FTP port `21`.

## Hints
1. Try connecting to the FTP server using an anonymous connection.
2. Check the directory for any files that may contain the flag.
3. The flag is in a file named `flag.txt` within the FTP server's root directory.

## Flag
`CTF{anonymous_ftp_access}`