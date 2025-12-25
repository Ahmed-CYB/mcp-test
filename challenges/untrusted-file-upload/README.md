# Untrusted File Upload

## Learning Objectives
- Understand the risks associated with insecure file uploads
- Learn how to exploit unrestricted file uploads to gain remote access
- Practice using web shells to gather sensitive information

## Challenge

A company's file sharing service is vulnerable to malicious file uploads. Your task is to upload a web shell to gain access and find the hidden flag stored on the server.

Access the victim service at http://victim:8080.

## Hints
1. Consider what types of files could be dangerous if allowed to execute on a server.
2. Look for ways to execute code server-side after uploading a file.
3. The flag is hidden in a location accessible by web shell operations.