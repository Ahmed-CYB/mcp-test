#!/bin/bash
# FTP Server Setup Script

echo "Setting up Anonymous FTP Misconfiguration Challenge..."

# Install services
apt update
apt install -y vsftpd openssh-server

# Create directory structure
mkdir -p /srv/ftp/documents
mkdir -p /srv/ftp/backup/system
chown -R ftp:ftp /srv/ftp
chmod -R 755 /srv/ftp

# Create users
useradd -m -s /bin/bash admin
useradd -m -s /bin/bash backup
useradd -m -s /bin/bash ftpadmin

# Set passwords
echo 'admin:SecureP@ss2024' | chpasswd
echo 'backup:BackupUser123' | chpasswd
echo 'ftpadmin:FtpAdmin2024' | chpasswd

# Add admin to sudo group
usermod -aG sudo admin

# Configure services
cp vsftpd.conf /etc/vsftpd/
cp sshd_config /etc/ssh/

# Place files
cp welcome.txt /srv/ftp/
cp company_policy.pdf /srv/ftp/documents/
cp system_backup.tar.gz /srv/ftp/backup/system/
cp credentials.txt /srv/ftp/backup/system/
cp flag.txt /root/
chmod 600 /root/flag.txt

# Set dangerous permissions (misconfiguration)
chmod 644 /srv/ftp/backup/system/credentials.txt
chmod 644 /srv/ftp/backup/system/system_backup.tar.gz

# Start services
systemctl restart vsftpd
systemctl restart ssh
systemctl enable vsftpd
systemctl enable ssh

echo "Challenge setup complete!"
echo "FTP Server running on port 21 (anonymous access enabled)"
echo "SSH Server running on port 22"
echo "Target: Gain SSH access and retrieve /root/flag.txt"