#!/bin/bash
# FTP Server Setup Script

# Install vsftpd
apt-get update
apt-get install -y vsftpd

# Create FTP directory structure
mkdir -p /var/ftp/pub/documents
mkdir -p /var/ftp/uploads

# Set permissions
chown -R ftp:ftp /var/ftp
chmod 755 /var/ftp
chmod 755 /var/ftp/pub
chmod 755 /var/ftp/pub/documents
chmod 777 /var/ftp/uploads

# Copy configuration
cp vsftpd.conf /etc/vsftpd/

# Create flag and files
echo 'CTF{4n0nym0u5_ftp_m15c0nf1g_3xp053d}' > /var/ftp/pub/documents/flag.txt
echo 'COMPANY SECURITY POLICY' > /var/ftp/pub/company_policy.txt
echo 'Welcome to Company FTP Server' > /var/ftp/readme.txt

# Start services
systemctl enable vsftpd
systemctl start vsftpd
systemctl enable ssh
systemctl start ssh

# Configure firewall
ufw allow 21/tcp
ufw allow 22/tcp
ufw allow 40000:50000/tcp

echo 'FTP Server configured successfully!'
echo 'Anonymous FTP enabled on port 21'
echo 'SSH enabled on port 22'