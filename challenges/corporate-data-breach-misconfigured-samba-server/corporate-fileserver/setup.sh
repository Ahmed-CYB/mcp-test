#!/bin/bash
# SMB Server Setup Script

# Install Samba
apt-get update
apt-get install -y samba samba-common-bin

# Create directories
mkdir -p /srv/samba/{public,finance,hr,backups/.hidden}

# Set permissions
chmod 755 /srv/samba/public
chmod 750 /srv/samba/finance
chmod 700 /srv/samba/hr
chmod 755 /srv/samba/backups
chmod 700 /srv/samba/backups/.hidden

# Create users
useradd -M -s /bin/false financeuser
useradd -M -s /bin/false consultant
useradd -M -s /bin/false hrmanager
useradd -M -s /bin/false sysadmin

# Set SMB passwords (weak passwords for CTF)
echo -e 'finance123\nfinance123' | smbpasswd -a financeuser
echo -e 'consult456\nconsult456' | smbpasswd -a consultant
echo -e 'hr789\nhr789' | smbpasswd -a hrmanager
echo -e 'admin123\nadmin123' | smbpasswd -a sysadmin

# Copy configuration
cp smb.conf /etc/samba/smb.conf

# Restart services
systemctl restart smbd
systemctl restart nmbd

# Enable services
systemctl enable smbd
systemctl enable nmbd

echo 'SMB server configured with intentional misconfigurations'