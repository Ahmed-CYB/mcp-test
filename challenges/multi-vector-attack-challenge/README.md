# Multi-Vector Attack Challenge

## Description
This challenge involves exploiting multiple vulnerabilities across different services. Each service is hosted on a separate virtual machine with its specific IP address. The objective is to exploit the vulnerabilities and retrieve the flags.

## Learning Objectives
- Understand and exploit XSS vulnerabilities
- Learn to identify and exploit weak SSH configurations
- Comprehend the EternalBlue exploit and how it can be used against vulnerable FTP servers

## Services
- **XSS Service**: Accessible at http://172.25.0.10:8080
- **SSH Service**: Accessible via SSH at 172.25.0.20
- **FTP Service**: Accessible via FTP at 172.25.0.30

## Flags
- **XSS Flag**: Found after exploiting XSS vulnerability
- **SSH Flag**: Retrieved after gaining access through SSH
- **FTP Flag**: Located in the FTP server directory

## Hints
1. Try injecting scripts in input fields to find the XSS.
2. Check SSH configurations for weak passwords.
3. Investigate the FTP server for known vulnerabilities.