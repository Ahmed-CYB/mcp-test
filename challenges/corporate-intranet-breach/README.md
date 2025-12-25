# Corporate Intranet Breach

## Learning Objectives
- Understand cross-site scripting (XSS)
- Perform FTP brute-forcing and directory exploration
- Exploit misconfigured SSH for unauthorized access
- Combine multiple vulnerabilities for a comprehensive attack

## Access Instructions
1. Use the Kali container to access the web application at http://172.25.0.10:8080
2. Inspect the source code and discover vulnerabilities
3. Exploit the XSS vulnerability to extract sensitive information
4. Access FTP and SSH services to gather more data

## Services
- Web Server: 172.25.0.10
- FTP Server: 172.25.0.20
- SSH Server: 172.25.0.30

## Flag
The flag is located within the FTP and SSH servers.