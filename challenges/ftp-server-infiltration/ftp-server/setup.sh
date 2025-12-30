#!/bin/bash
# FTP Server Setup Script

echo "Setting up FTP Server Challenge..."

# Install vsftpd
sudo apt update
sudo apt install -y vsftpd

# Create FTP users
sudo useradd -m -s /bin/bash ftpuser
sudo useradd -m -s /bin/bash backupuser
echo 'ftpuser:ftp123' | sudo chpasswd
echo 'backupuser:backup2023' | sudo chpasswd

# Create directory structure
sudo mkdir -p /var/ftp/pub
sudo mkdir -p /home/ftpuser/ftp/private
sudo chown -R ftp:ftp /var/ftp/pub
sudo chown -R ftpuser:ftpuser /home/ftpuser/ftp
sudo chmod 755 /var/ftp/pub
sudo chmod 755 /home/ftpuser/ftp
sudo chmod 700 /home/ftpuser/ftp/private

# Copy configuration files
sudo cp vsftpd.conf /etc/vsftpd/
sudo cp chroot_list /etc/vsftpd/

# Copy challenge files
sudo cp welcome.txt /var/ftp/pub/
sudo cp department_files.zip /var/ftp/pub/
sudo cp config_backup.txt /home/ftpuser/ftp/private/
sudo cp employees.csv /home/ftpuser/ftp/

# Set permissions
sudo chmod 644 /var/ftp/pub/*
sudo chmod 644 /home/ftpuser/ftp/employees.csv
sudo chmod 600 /home/ftpuser/ftp/private/config_backup.txt

# Start services
sudo systemctl restart vsftpd
sudo systemctl enable vsftpd
sudo systemctl restart ssh

# Configure firewall
sudo ufw allow 21/tcp
sudo ufw allow 22/tcp
sudo ufw allow 20/tcp

echo "FTP Server Challenge setup complete!"
echo "Services running on:"
echo "- FTP: Port 21 (anonymous access enabled)"
echo "- SSH: Port 22"
echo "Test with: ftp <server-ip>"