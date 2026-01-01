#!/bin/bash

# Corporate File Server Setup Script
echo "Setting up corporate file server..."

# Create Samba directories
sudo mkdir -p /srv/samba/{public,finance,backup,admin}

# Set permissions
sudo chmod 755 /srv/samba/public
sudo chmod 750 /srv/samba/finance
sudo chmod 755 /srv/samba/backup
sudo chmod 700 /srv/samba/admin

# Create files
sudo cp quarterly_report.txt /srv/samba/finance/
sudo cp system_backup.conf /srv/samba/backup/
sudo cp public_notice.txt /srv/samba/public/
sudo cp employee_list.csv /srv/samba/public/

# Install and configure Samba
sudo apt update
sudo apt install -y samba samba-common-bin
sudo cp smb.conf /etc/samba/

# Create Samba users
sudo useradd -M -s /sbin/nologin administrator
echo -e "Corp@dmin123\nCorp@dmin123" | sudo smbpasswd -a administrator

# Start services
sudo systemctl enable smbd nmbd
sudo systemctl restart smbd nmbd

# Configure firewall
sudo ufw allow 139/tcp
sudo ufw allow 445/tcp
sudo ufw allow 137/udp
sudo ufw allow 138/udp

echo "Corporate file server setup complete!"
echo "SMB shares available on ports 139/445"
echo "Use 'smbclient -L //IP_ADDRESS -N' to enumerate shares"