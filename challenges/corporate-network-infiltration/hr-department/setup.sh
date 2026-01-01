#!/bin/bash
# DataFlow Industries HR Department Setup

# Create FTP directories
sudo mkdir -p /srv/ftp/public
sudo chown -R ftp:ftp /srv/ftp/
sudo chmod 755 /srv/ftp/public

# Create SMB directories
sudo mkdir -p /srv/samba/public
sudo mkdir -p /srv/samba/hr-confidential
sudo mkdir -p /srv/samba/network
sudo chown -R nobody:nogroup /srv/samba/public
sudo chown -R nobody:nogroup /srv/samba/network
sudo chmod 755 /srv/samba/public /srv/samba/network

# Install and configure services
sudo apt-get update
sudo apt-get install -y vsftpd samba openssh-server

# Start services
sudo systemctl enable vsftpd
sudo systemctl start vsftpd
sudo systemctl enable smbd
sudo systemctl start smbd
sudo systemctl enable ssh
sudo systemctl start ssh

# Create user accounts
sudo useradd -m -s /bin/bash guest
sudo useradd -m -s /bin/bash hruser
sudo useradd -m -s /bin/bash networkadmin
sudo passwd -d guest  # Remove password for guest
echo 'hruser:HR2024admin' | sudo chpasswd
echo 'networkadmin:NetAdmin123' | sudo chpasswd

# Configure SMB users
echo -e 'HR2024admin\nHR2024admin' | sudo smbpasswd -a hruser
echo -e 'NetAdmin123\nNetAdmin123' | sudo smbpasswd -a networkadmin

echo 'Challenge setup complete!'
echo 'Services running on:'
echo '- FTP: Port 21 (Anonymous access)'
echo '- SMB: Ports 139/445 (Null session enabled)'
echo '- SSH: Port 22 (Weak authentication)'