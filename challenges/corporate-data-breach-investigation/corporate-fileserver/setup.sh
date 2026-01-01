#!/bin/bash
# Corporate File Server Setup Script

# Create SMB directories
sudo mkdir -p /srv/samba/{public,temp,finance,backups,hr}

# Set permissions
sudo chmod 755 /srv/samba/public /srv/samba/temp
sudo chmod 750 /srv/samba/finance /srv/samba/backups /srv/samba/hr

# Create users
sudo useradd -m backup
sudo useradd -m anonymous
sudo useradd -m guest
sudo useradd -m jdoe
sudo useradd -m msmith
sudo useradd -m hradmin
sudo useradd -m admin

# Set passwords
echo 'backup:B@ckup2024!' | sudo chpasswd
echo 'jdoe:Finance123' | sudo chpasswd
echo 'msmith:Analyst2024' | sudo chpasswd
echo 'hradmin:HRsecure99' | sudo chpasswd
echo 'admin:Admin@Corp24' | sudo chpasswd

# Configure Samba users
sudo smbpasswd -a backup -s <<< $'B@ckup2024!\nB@ckup2024!'
sudo smbpasswd -a jdoe -s <<< $'Finance123\nFinance123'
sudo smbpasswd -a msmith -s <<< $'Analyst2024\nAnalyst2024'
sudo smbpasswd -a hradmin -s <<< $'HRsecure99\nHRsecure99'
sudo smbpasswd -a admin -s <<< $'Admin@Corp24\nAdmin@Corp24'

# Set file ownership
sudo chown -R backup:backup /srv/samba/backups
sudo chown -R jdoe:jdoe /srv/samba/finance
sudo chown -R hradmin:hradmin /srv/samba/hr

# Create SSH directory for backup user
sudo mkdir -p /home/backup/.ssh
sudo chown backup:backup /home/backup/.ssh

# Start services
sudo systemctl enable smbd
sudo systemctl start smbd
sudo systemctl enable ssh
sudo systemctl restart ssh

echo 'Corporate file server setup complete!'