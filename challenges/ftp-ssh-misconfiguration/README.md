# FTP and SSH Misconfiguration Challenge

## Scenario
A company's FTP and SSH server have been misconfigured, exposing them to potential security risks. Your goal is to identify and exploit these configurations to capture the flag.

## Setup
- The victim machine runs a misconfigured SSH and FTP server.
- SSH allows root login with password authentication.
- FTP has a misconfigured chroot environment.

## Objectives
- Identify the misconfigurations.
- Exploit the misconfigurations to access sensitive information.
- Capture the flag located in `/home/ftpuser/flag.txt`.

## Access
- SSH: `ssh root@victim`
- FTP: `ftp ftpuser@victim`

## Learning Objectives
- Understand the risks of permitting root login via SSH.
- Learn about FTP configuration pitfalls, especially around chroot.

## Tips
- Check default configurations and user permissions.
- Misconfigurations often lie in the least expected places.

## Hints
1. Examine the SSH configuration for permissive options.
2. Look into the FTP user directory permissions.
3. Try accessing the flag directly via FTP.