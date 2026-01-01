#!/bin/bash

# Project Archive FTP Server Setup Script

echo "Setting up Project Archive FTP Server..."

# Create FTP directory structure
sudo mkdir -p /srv/ftp/public/archive/legacy
sudo mkdir -p /srv/ftp/public/archive/documentation
sudo mkdir -p /srv/ftp/public/resources
sudo mkdir -p /srv/ftp/private/dev_vault/secrets
sudo mkdir -p /srv/ftp/private/dev_vault/configurations
sudo mkdir -p /srv/ftp/private/admin_tools

# Set up FTP users and groups
sudo groupadd ftpusers
sudo useradd -m -g ftpusers -s /bin/bash ftpadmin
sudo useradd -m -g ftpusers -s /bin/bash devuser
sudo useradd -r -s /usr/sbin/nologin ftpsecure

# Set passwords (weak for demonstration)
echo 'ftpadmin:Archive2024!' | sudo chpasswd
echo 'devuser:Dev@cc3ss123' | sudo chpasswd

# Install and configure vsftpd
sudo apt-get update
sudo apt-get install -y vsftpd
sudo systemctl stop vsftpd

# Set directory permissions
sudo chown -R ftpadmin:ftpusers /srv/ftp/public
sudo chown -R devuser:ftpusers /srv/ftp/private
sudo chmod -R 755 /srv/ftp/public
sudo chmod -R 750 /srv/ftp/private
sudo chmod 640 /srv/ftp/private/dev_vault/secrets/.env_production

# Configure vsftpd
sudo cp vsftpd.conf /etc/vsftpd/
sudo systemctl enable vsftpd
sudo systemctl start vsftpd

# Configure SSH
sudo cp sshd_config /etc/ssh/
sudo systemctl restart ssh

# Create banner
echo 'Welcome to ProjectArchive FTP Service - Authorized Access Only' | sudo tee /etc/issue.net

# Set up firewall rules
sudo ufw allow 21/tcp
sudo ufw allow 22/tcp
sudo ufw allow 10000:10100/tcp

echo "Setup complete! FTP server running on port 21"
echo "SSH server running on port 22"
echo "Anonymous FTP access enabled for /srv/ftp/public"
echo "Authenticated access required for /srv/ftp/private"