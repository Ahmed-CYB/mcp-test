#!/bin/bash

# Create SMB directories
sudo mkdir -p /srv/samba/{public,dev,backups}
sudo chmod 755 /srv/samba/public /srv/samba/dev
sudo chmod 700 /srv/samba/backups

# Create TFTP directory
sudo mkdir -p /srv/tftp
sudo chmod 755 /srv/tftp

# Create users
sudo useradd -m devuser
echo 'devuser:dev123corp' | sudo chpasswd
sudo useradd -m backup
echo 'backup:backup456' | sudo chpasswd
sudo groupadd backup
sudo usermod -aG backup backup

# Set SMB passwords
echo -e 'backup456\nbackup456' | sudo smbpasswd -a backup
echo -e 'dev123corp\ndev123corp' | sudo smbpasswd -a devuser

# Start services
sudo systemctl enable smbd nmbd
sudo systemctl start smbd nmbd
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl enable tftpd-hpa
sudo systemctl start tftpd-hpa

# Set file ownership
sudo chown -R nobody:nogroup /srv/samba/public
sudo chown -R devuser:devuser /srv/samba/dev
sudo chown -R backup:backup /srv/samba/backups
sudo chown -R tftp:tftp /srv/tftp

echo "Corporate fileserver configured successfully"