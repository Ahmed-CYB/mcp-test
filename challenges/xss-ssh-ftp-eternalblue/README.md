# xss-ssh-ftp-eternalblue

## Learning Objectives
- Understand the impact of XSS in web applications.
- Learn about SSH and FTP vulnerabilities.
- Explore the EternalBlue vulnerability.
- Practice exploiting multiple services to capture a flag.

## Challenge Details
You are tasked with exploiting a file hosting service that contains several vulnerabilities including XSS, SSH, FTP misconfigurations, and an unpatched EternalBlue vulnerability.

## Access Instructions
- Web Service: http://172.25.0.10:8080
- FTP Service: Connect to 172.25.0.20 (user: admin, password: adminPass)
- SSH Service: Connect to 172.25.0.30 (root password: root)
- EternalBlue Service: Target 172.25.0.40

## Hints
1. Look for XSS vulnerabilities on the web interface.
2. Check for default or weak passwords in SSH and FTP services.
3. EternalBlue requires specific exploitation tools available on Kali.

## Flag
Capture the flag placed in /home/ftpusers/admin/flag.txt on the FTP server.