# FTP Weak Permissions Challenge

## Scenario
TechCorp has deployed an FTP server for internal file sharing. However, due to a configuration oversight, a sensitive file is accessible to the public. Your goal is to exploit the FTP configuration to retrieve the flag.

## Instructions
- Use the Kali Linux container to interact with the FTP server at `ftp://victim:21`
- The target file is inside the FTP directory with improper permissions.

## Learning Objectives
- Understand FTP server configuration and file permissions
- Learn to exploit misconfigured file permissions in FTP
- Practice using FTP client tools for enumeration

## Hints
1. Consider the default permissions that might allow public access.
2. The anonymous user might have more access than expected.
3. Look for files with world-readable permissions.
