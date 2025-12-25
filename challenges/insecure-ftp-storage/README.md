# Insecure FTP Storage Challenge

## Description
A company is using an FTP server to store internal files. However, there are no proper access controls in place, making it possible to access sensitive information without authorization.

## Objectives
- Understand how to enumerate and access FTP servers.
- Learn to exploit misconfigurations in anonymous FTP setups.

## Setup Instructions
- Deploy the challenge using `docker-compose up --build`.
- Access the FTP server from the Kali Linux container.
- The flag is stored in `/srv/ftp/flag.txt` on the FTP server.

## Access
- **Victim**: 172.25.0.10
- **FTP Port**: 21

## Learning Objectives
- Gain hands-on experience with FTP enumeration.
- Explore insecure configurations in FTP services.

## Hints
1. Try connecting to the FTP server anonymously.
2. Look for directories and files accessible with anonymous login.
3. The flag is stored in a file in the root directory of the FTP server.
