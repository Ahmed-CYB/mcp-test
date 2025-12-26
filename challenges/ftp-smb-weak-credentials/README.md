# FTP and SMB Weak Credentials Challenge

## Learning Objectives
- Understand how to exploit FTP anonymous access.
- Learn to identify and exploit SMB weak password configurations.

## Scenario
Explore two services hosted on the victim machine and exploit their misconfigurations to retrieve flags.
1. FTP service allows anonymous logins that exposes sensitive information.
2. SMB service misconfiguration allows accessing with weak credentials.

## Access Instructions
- Use the Kali container to connect to the victim's FTP and SMB service using private IP 172.25.0.10.
- Retrieve `/srv/ftp/flag.txt` and `/srv/smb/flag.txt` using discovered credentials.

## Tools
- `ftp` for accessing FTP service.
- `smbclient` for accessing SMB service.
