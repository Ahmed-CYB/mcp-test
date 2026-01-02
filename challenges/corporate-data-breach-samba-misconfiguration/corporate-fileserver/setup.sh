#!/bin/bash
# Corporate File Server Setup Script

# Create Samba directories
sudo mkdir -p /srv/samba/{public,accounting,legacy,admin}
sudo mkdir -p /srv/samba/legacy/backup/config
sudo mkdir -p /tmp/smbshare

# Set permissions
sudo chmod 755 /srv/samba/public
sudo chmod 750 /srv/samba/accounting
sudo chmod 755 /srv/samba/legacy
sudo chmod 700 /srv/samba/admin
sudo chmod 777 /tmp/smbshare

# Create users and groups
sudo groupadd accounting
sudo useradd -g accounting -s /bin/bash accountant
sudo useradd -s /bin/bash admin
sudo useradd -s /bin/bash backup_user
sudo useradd -s /bin/bash temp_admin

# Set passwords
echo 'admin:admin123' | sudo chpasswd
echo 'backup_user:backup2023' | sudo chpasswd
echo 'temp_admin:temppass' | sudo chpasswd

# Install and configure Samba
sudo apt-get update
sudo apt-get install -y samba samba-common-bin
sudo cp smb.conf /etc/samba/
sudo systemctl restart smbd
sudo systemctl enable smbd

# Configure SSH
sudo cp sshd_config /etc/ssh/
sudo systemctl restart ssh

# Setup legacy protocol service
sudo mkdir -p /opt/legacy
sudo cp legacy_protocol.py /opt/legacy/
sudo chmod +x /opt/legacy/legacy_protocol.py

# Create systemd service for legacy protocol
sudo tee /etc/systemd/system/legacy-protocol.service > /dev/null <<EOF
[Unit]
Description=Legacy File Transfer Protocol
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/legacy
ExecStart=/usr/bin/python3 /opt/legacy/legacy_protocol.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable legacy-protocol
sudo systemctl start legacy-protocol

echo "Corporate file server setup complete"
echo "Services running:"
echo "- SMB on port 445"
echo "- SSH on port 22"
echo "- Legacy Protocol on port 20"