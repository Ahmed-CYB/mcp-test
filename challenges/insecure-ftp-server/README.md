# Insecure FTP Server Challenge

## Learning Objectives
- Understand the risks associated with misconfigured anonymous FTP servers
- Explore FTP command-line utilities
- Exploit FTP server misconfigurations to gain unauthorized access

## Scenario
A company has set up an FTP server for sharing files internally. However, it has been misconfigured, allowing anonymous access to sensitive files. Your mission is to exploit this vulnerability to retrieve a file containing a secret flag.

## Deployment
- Use Docker Compose to set up the victim and attacker environments.
- Access the FTP server from the Kali Linux container at `ftp://victim:21`

## Hints
1. Consider the access level granted by the FTP server's configuration.
2. What kind of operations does anonymous access allow?
3. The flag is stored in the FTP server's root directory.
