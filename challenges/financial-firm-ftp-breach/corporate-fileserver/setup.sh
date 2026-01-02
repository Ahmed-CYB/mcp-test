#!/bin/bash
# Setup script for Financial FTP Challenge

# Install and configure vsftpd
apt-get update
apt-get install -y vsftpd

# Create directory structure
mkdir -p /srv/ftp/public/reports
mkdir -p /srv/ftp/public/logs
mkdir -p /srv/ftp/private/sensitive
mkdir -p /var/run/vsftpd/empty

# Set permissions
chown -R ftp:ftp /srv/ftp/public
chown -R root:root /srv/ftp/private
chmod 755 /srv/ftp/public
chmod 750 /srv/ftp/private
chmod 644 /srv/ftp/public/reports/*
chmod 644 /srv/ftp/public/logs/*
chmod 600 /srv/ftp/private/sensitive/*

# Create backup user
useradd -m -s /bin/bash backup_user
echo 'backup_user:Finance2024!' | chpasswd

# Copy configuration files
cp vsftpd.conf /etc/vsftpd/
cp welcome.txt /etc/vsftpd/

# Start FTP service
systemctl enable vsftpd
systemctl start vsftpd

# Configure firewall
ufw allow 27/tcp
ufw allow 40000:40100/tcp

echo "FTP Server configured on port 27"
echo "Anonymous access enabled with public directory access"
echo "Challenge ready!"