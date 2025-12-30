#!/bin/bash
# SMB Server Setup Script

# Install Samba
apt-get update
apt-get install -y samba samba-common-bin

# Create directories
mkdir -p /srv/samba/{public,confidential,backup}

# Set permissions
chown -R nobody:nogroup /srv/samba/public
chown -R nobody:nogroup /srv/samba/confidential
chown -R root:root /srv/samba/backup

chmod -R 755 /srv/samba/public
chmod -R 755 /srv/samba/confidential
chmod -R 644 /srv/samba/backup

# Copy configuration
cp smb.conf /etc/samba/smb.conf

# Create samba users
echo -e "password123\npassword123" | smbpasswd -a -s admin
echo -e "backup456\nbackup456" | smbpasswd -a -s backup

# Restart services
systemctl restart smbd
systemctl restart nmbd
systemctl enable smbd
systemctl enable nmbd

# Configure firewall
ufw allow 139/tcp
ufw allow 445/tcp
ufw allow 137/udp
ufw allow 138/udp

echo "SMB server configured with intentional misconfigurations for CTF"