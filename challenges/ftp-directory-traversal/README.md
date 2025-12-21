# FTP Directory Traversal Challenge

## Learning Objectives
- Understand FTP server misconfigurations
- Identify directory traversal vulnerabilities
- Use Kali Linux tools to exploit FTP services

## Scenario
A company's FTP server is not configured securely, leaving sensitive data in a hidden directory vulnerable to unauthorized access. Your task is to identify and exploit this vulnerability.

## Instructions
1. Access the Kali Linux container using the credentials printed by the Docker environment.
2. Connect to the FTP server running on `ftp://victim`.
3. Use directory traversal techniques to find the `flag.txt` file.

## Hints
1. Start by looking at the server's directory structure.
2. Remember that some files might not be listed due to misconfigurations.
3. Use common FTP tools in Kali Linux to navigate the directories.