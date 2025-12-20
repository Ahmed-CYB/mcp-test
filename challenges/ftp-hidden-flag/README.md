# FTP Hidden Flag Challenge

## Learning Objectives
- Understand basic FTP server operations
- Explore directory listing and hidden files
- Learn how to use FTP clients for accessing remote servers

### Scenario
A company has an FTP server for file sharing among employees. Due to a recent security audit, a potential misconfiguration was identified, allowing for unintended access to certain files. Your mission is to explore the FTP server and retrieve the hidden flag.

### Setup Instructions
1. Build and run the Docker containers using `docker-compose up`.
2. Access the Kali Linux instance through your browser using the VNC port (http://localhost:6901), password: `password`.
3. Use FTP tools available in Kali to connect to the FTP server at `ftp://ftp_server/` with credentials `testuser:testpass`.
4. Investigate the server to find the flag.

### Hints
1. Try listing all files and directories, including hidden ones.
2. Use FTP commands effectively to navigate the server.
3. The flag might not be in the main user directory.

### Notes
- This challenge helps in understanding the use of FTP commands and exploring potential security misconfigurations.
- The FTP server is intentionally configured to allow directory listing.

Good luck, and have fun!