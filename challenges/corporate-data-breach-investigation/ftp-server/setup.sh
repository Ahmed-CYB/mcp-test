#!/bin/bash
# FTP Server Setup Script

echo "Setting up Corporate Testing FTP Server..."

# Create directory structure
sudo mkdir -p /srv/ftp/public
sudo mkdir -p /srv/ftp/backup/.hidden
sudo mkdir -p /var/run/vsftpd/empty

# Set permissions
sudo chmod 755 /srv/ftp
sudo chmod 755 /srv/ftp/public
sudo chmod 755 /srv/ftp/backup
sudo chmod 755 /srv/ftp/backup/.hidden
sudo chmod 644 /srv/ftp/welcome.txt
sudo chmod 644 /srv/ftp/public/*
sudo chmod 644 /srv/ftp/backup/*
sudo chmod 644 /srv/ftp/backup/.hidden/*

# Create ftpsecure user
sudo useradd -r -s /bin/false ftpsecure

# Install and configure vsftpd
sudo apt-get update
sudo apt-get install -y vsftpd
sudo systemctl stop vsftpd
sudo cp vsftpd.conf /etc/vsftpd/vsftpd.conf
sudo systemctl start vsftpd
sudo systemctl enable vsftpd

echo "FTP Server setup complete!"
echo "Server listening on port 21 (control) and port 20 (data)"
echo "Anonymous access enabled with root at /srv/ftp"