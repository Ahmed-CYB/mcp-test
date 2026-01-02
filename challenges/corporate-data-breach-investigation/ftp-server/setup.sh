#!/bin/bash
# Setup script for Financial Consulting FTP Challenge

echo "Setting up Financial Consulting FTP Server Challenge..."

# Install and configure vsftpd
apt-get update
apt-get install -y vsftpd

# Create directory structure
mkdir -p /srv/ftp/public
mkdir -p /srv/ftp/users/{admin,reports,backup,jdoe,smith,johnson}

# Set proper permissions
chown -R ftp:ftp /srv/ftp/public
chmod 755 /srv/ftp/public
chmod 644 /srv/ftp/public/*

# Create user accounts
useradd -d /srv/ftp/users/admin -s /bin/false admin
useradd -d /srv/ftp/users/reports -s /bin/false reports
useradd -d /srv/ftp/users/backup -s /bin/false backup
useradd -d /srv/ftp/users/jdoe -s /bin/false jdoe
useradd -d /srv/ftp/users/smith -s /bin/false smith
useradd -d /srv/ftp/users/johnson -s /bin/false johnson

# Set passwords
echo 'admin:TempPass789' | chpasswd
echo 'reports:quarterly' | chpasswd
echo 'backup:backup2023' | chpasswd
echo 'jdoe:Welcome2023' | chpasswd
echo 'smith:Finance123' | chpasswd
echo 'johnson:Consulting456' | chpasswd

# Set directory permissions
chown admin:admin /srv/ftp/users/admin
chown reports:reports /srv/ftp/users/reports
chown backup:backup /srv/ftp/users/backup
chmod 750 /srv/ftp/users/*

# Copy configuration files
cp vsftpd.conf /etc/vsftpd/

# Restart vsftpd service
systemctl restart vsftpd
systemctl enable vsftpd

# Configure firewall
ufw allow 26/tcp
ufw allow 21000:21010/tcp

echo "FTP server setup complete on port 26"
echo "Anonymous access enabled with public directory"
echo "User accounts created with weak passwords"
echo "Challenge ready for exploitation!"