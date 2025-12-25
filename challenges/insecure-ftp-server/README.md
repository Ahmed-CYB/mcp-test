# Insecure FTP Server Challenge

## Learning Objectives
- Understand FTP server configurations
- Identify common FTP misconfigurations leading to data leakage
- Use Kali Linux to connect to an FTP server

## Challenge Description
A small company has an FTP server setup to store and share files. However, due to some misconfigurations, sensitive files might be exposed to anonymous users. Your task is to exploit this misconfiguration to retrieve the secret flag file.

## Accessing the Challenge
- The FTP server is running on `ftp://victim` within the provided Kali Linux environment.
- No additional tools are needed beyond those provided in Kali.

## Hints
1. Consider what services are enabled for anonymous users.
2. Check if you can list directories and access files as an anonymous user.
3. You may not need credentials; explore what anonymous access provides.
