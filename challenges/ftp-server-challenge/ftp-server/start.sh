#!/bin/bash
# FTP Server Startup Script

# Create FTP directory
mkdir -p /ftp/public /ftp/data

# Set permissions
chmod 755 /ftp/public
chmod 755 /ftp/data

# Place flag in data directory
echo "CTF{network_sirs429uy8_e}" > /ftp/data/flag.txt
chmod 644 /ftp/data/flag.txt

# Create welcome message
echo "Welcome to the CTF FTP Server!" > /ftp/public/welcome.txt

# Start vsftpd
service vsftpd start

# Keep container running
tail -f /dev/null