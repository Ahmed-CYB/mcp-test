# FTP User Data Exfiltration Challenge

## Scenario
An insecure FTP server is running and is leaking sensitive user data. Your task is to connect to the FTP server, navigate through the files, and extract a specific piece of information that contains the flag.

## Learning Objectives
- Understand the basics of FTP servers and how they can be misconfigured
- Learn how to navigate and extract data from FTP servers
- Practice identifying sensitive information within file structures

## Instructions
1. Access the Kali Linux desktop environment provided in the attacker container.
2. Use FTP tools to connect to the FTP server running at `ftp://172.25.0.10`.
3. Explore the available directories and locate `flag.txt`.
4. Extract the flag: `CTF{ftp_data_exfiltration_success}`

## Hints
- Start by listing the files available in the FTP server's root directory.
- Look for any files that might contain sensitive information or instructions.
- The flag file is located in a common directory that many FTP servers use.
