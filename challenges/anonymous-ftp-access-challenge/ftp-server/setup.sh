#!/bin/bash
# FTP Server Setup Script

echo "Setting up FTP server with anonymous access..."

# Install vsftpd
apt-get update
apt-get install -y vsftpd

# Create FTP directory structure
mkdir -p /srv/ftp/public
mkdir -p /srv/ftp/archives/backups/.hidden_backup

# Set permissions
chown -R ftp:ftp /srv/ftp
chmod -R 755 /srv/ftp
chmod 644 /srv/ftp/archives/backups/.hidden_backup/flag.txt

# Copy configuration
cp vsftpd.conf /etc/vsftpd/vsftpd.conf

# Enable and start services
systemctl enable vsftpd
systemctl start vsftpd
systemctl enable ssh
systemctl start ssh

# Create dummy files for realism
touch /srv/ftp/public/handbook.pdf
touch /srv/ftp/public/safety.pdf
touch /srv/ftp/public/network_policy.pdf

echo "FTP server setup complete!"
echo "Anonymous access enabled on port 21"
echo "SSH access available on port 22"