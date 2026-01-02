#!/bin/bash

# Corporate File Server Setup Script
echo "Setting up Corporate File Server..."

# Create SMB directories
sudo mkdir -p /srv/samba/{public,hr,finance,temp,backup}

# Set permissions
sudo chmod 755 /srv/samba/public
sudo chmod 770 /srv/samba/hr
sudo chmod 770 /srv/samba/finance
sudo chmod 777 /srv/samba/temp
sudo chmod 750 /srv/samba/backup

# Create groups
sudo groupadd hr-group
sudo groupadd finance-group

# Create users and add to groups
sudo useradd -m jsmith && sudo usermod -a -G hr-group jsmith
sudo useradd -m rbrown && sudo usermod -a -G hr-group rbrown
sudo useradd -m tgreen && sudo usermod -a -G hr-group tgreen
sudo useradd -m mwilson && sudo usermod -a -G finance-group mwilson
sudo useradd -m dlee && sudo usermod -a -G finance-group dlee
sudo useradd -m admin
sudo useradd -m backup

# Set SMB passwords (using temp passwords from database)
echo -e "Welcome2024\nWelcome2024" | sudo smbpasswd -a jsmith
echo -e "Finance123\nFinance123" | sudo smbpasswd -a mwilson
echo -e "HRpass2024\nHRpass2024" | sudo smbpasswd -a rbrown
echo -e "AdminBackup2024\nAdminBackup2024" | sudo smbpasswd -a admin
echo -e "Budget2024\nBudget2024" | sudo smbpasswd -a dlee
echo -e "BackupSys2024\nBackupSys2024" | sudo smbpasswd -a backup
echo -e "Personnel24\nPersonnel24" | sudo smbpasswd -a tgreen

# Set SSH passwords
echo "jsmith:Welcome2024" | sudo chpasswd
echo "mwilson:Finance123" | sudo chpasswd
echo "rbrown:HRpass2024" | sudo chpasswd
echo "admin:AdminBackup2024" | sudo chpasswd
echo "dlee:Budget2024" | sudo chpasswd
echo "backup:BackupSys2024" | sudo chpasswd

# Set file ownership
sudo chown -R root:hr-group /srv/samba/hr
sudo chown -R root:finance-group /srv/samba/finance
sudo chown -R nobody:nogroup /srv/samba/temp
sudo chown -R admin:admin /srv/samba/backup

# Start services
sudo systemctl enable smbd nmbd ssh
sudo systemctl restart smbd nmbd ssh

echo "Corporate File Server setup complete!"
echo "Services running: SMB (445), SSH (22)"
echo "Shares: public (guest), hr, finance, temp (guest), backup (admin only)"