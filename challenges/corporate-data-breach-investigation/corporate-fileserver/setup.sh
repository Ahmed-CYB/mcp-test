#!/bin/bash
# Corporate File Server Setup Script

# Create SMB directories
sudo mkdir -p /srv/samba/{public,finance,hr,backup,testing}

# Set permissions
sudo chmod 755 /srv/samba/public
sudo chmod 750 /srv/samba/finance
sudo chmod 750 /srv/samba/hr
sudo chmod 700 /srv/samba/backup
sudo chmod 777 /srv/samba/testing

# Create groups
sudo groupadd finance
sudo groupadd hr
sudo groupadd testgroup

# Add users to groups
sudo usermod -a -G finance jdoe
sudo usermod -a -G hr johnson
sudo usermod -a -G testgroup testuser

# Set SMB passwords (weak for testing)
echo -e 'admin123\nadmin123' | sudo smbpasswd -a admin
echo -e 'password\npassword' | sudo smbpasswd -a jdoe
echo -e 'smithr123\nsmithr123' | sudo smbpasswd -a smithr
echo -e 'johnson123\njohnson123' | sudo smbpasswd -a johnson
echo -e 'testing123\ntesting123' | sudo smbpasswd -a testuser

# Start services
sudo systemctl enable smbd
sudo systemctl start smbd
sudo systemctl enable ssh
sudo systemctl start ssh

echo 'Corporate file server setup complete!'
echo 'SMB shares available on port 445'
echo 'SSH available on port 22'