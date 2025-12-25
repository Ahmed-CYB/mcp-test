# Mischievous FTP

## Overview

As a security consultant, your goal is to assess the FTP server's security. You must leverage your skills to find and read the flag hidden within the FTP server.

## Learning Objectives
- Understand FTP service configurations
- Identify and exploit incorrect file permissions

## Access Instructions
- Use the Kali Linux GUI provided in the attacker container
- Connect to the FTP server at ftpserver (172.25.0.10)
- No authentication is required due to misconfigured permissions

## Hints
1. Explore the default directories accessible via FTP.
2. Look for files with incorrect permissions that might allow read access.
3. The flag is hidden within a file that generally should be protected.
