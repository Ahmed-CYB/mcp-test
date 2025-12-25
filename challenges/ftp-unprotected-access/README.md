# FTP Unprotected Access

## Description
This challenge involves an FTP server configured to allow anonymous access. Participants need to leverage this misconfiguration to access the server and retrieve the flag.

## Learning Objectives
- Understand FTP server configurations and common security pitfalls.
- Learn how to connect to an FTP server and retrieve files.
- Gain experience in recognizing and exploiting inadvertent anonymous access.

## Setup
Deploy the challenge using Docker Compose. The FTP server will be accessible internally to the Kali attacker image.

## Exploitation Steps
1. Use an FTP client to connect to the FTP server at `172.21.0.10`.
2. Log in using anonymous credentials (username: anonymous, password: anonymous).
3. Navigate the directory to find and retrieve the `flag.txt` file.

## Hints
1. Consider how FTP servers can be misconfigured to permit unauthorized access.
2. FTP clients and commands can help you explore anonymous access options.
3. The flag is located in the root directory accessible by the FTP server.