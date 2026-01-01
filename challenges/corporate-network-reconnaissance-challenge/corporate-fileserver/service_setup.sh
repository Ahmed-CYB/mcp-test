#!/bin/bash
# Corporate File Server Setup Script

echo "Setting up Corporate Testing Environment FTP Server..."

# Install and configure vsftpd
sudo apt update
sudo apt install -y vsftpd

# Create FTP directory structure
sudo mkdir -p /srv/ftp/testing/{public,backup,dev}
sudo chown -R ftp:ftp /srv/ftp/testing
sudo chmod -R 755 /srv/ftp/testing

# Copy configuration
sudo cp vsftpd.conf /etc/vsftpd/

# Create test files with proper permissions
sudo cp welcome.msg /srv/ftp/testing/
sudo cp system_info.txt /srv/ftp/testing/public/
sudo cp backup_config.conf /srv/ftp/testing/backup/
sudo cp dev_notes.txt /srv/ftp/testing/dev/

# Set proper ownership
sudo chown -R ftp:ftp /srv/ftp/testing
sudo chmod 644 /srv/ftp/testing/backup/backup_config.conf

# Restart FTP service
sudo systemctl restart vsftpd
sudo systemctl enable vsftpd

# Open firewall port
sudo ufw allow 26/tcp
sudo ufw allow 30000:31000/tcp

echo "FTP server configured on port 26 with anonymous access enabled"
echo "Flag location: /srv/ftp/testing/backup/backup_config.conf"
echo "Access: ftp corporate-fileserver 26 (anonymous login)"