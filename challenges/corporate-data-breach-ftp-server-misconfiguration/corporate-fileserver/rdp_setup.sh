#!/bin/bash
# Corporate Backup Server RDP Setup
# WARNING: This setup has known security issues for demonstration purposes

echo "Setting up Corporate Backup Server RDP Service..."

# Install xrdp
sudo apt-get update
sudo apt-get install -y xrdp xfce4 xfce4-goodies

# Configure xrdp to run on custom port 29
sudo cp xrdp.ini /etc/xrdp/
sudo cp sesman.ini /etc/xrdp/

# Create backup_admin user with weak password
sudo useradd -m -s /bin/bash backup_admin
echo "backup_admin:BackupSys2023" | sudo chpasswd
sudo usermod -aG sudo backup_admin

# Set up user directories and files
sudo mkdir -p /home/backup_admin/Documents
sudo mkdir -p /home/backup_admin/Desktop
sudo cp backup_config.xml /home/backup_admin/Documents/
sudo cp network_shares.txt /home/backup_admin/Desktop/
sudo chown -R backup_admin:backup_admin /home/backup_admin/

# Configure weak encryption (demonstration purposes)
sudo openssl req -x509 -newkey rsa:1024 -keyout /etc/xrdp/key.pem -out /etc/xrdp/cert.pem -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Corp/CN=backup-server"
sudo chown xrdp:xrdp /etc/xrdp/key.pem /etc/xrdp/cert.pem
sudo chmod 600 /etc/xrdp/key.pem

# Restart xrdp service
sudo systemctl enable xrdp
sudo systemctl restart xrdp

# Configure firewall
sudo ufw allow 29/tcp

echo "RDP service configured on port 29"
echo "Username: backup_admin"
echo "Password: BackupSys2023"
echo "WARNING: This configuration has security vulnerabilities for training purposes"

# Generate network traffic for demonstration
sudo tcpdump -i any -w /tmp/rdp_traffic.pcap port 29 &
TCPDUMP_PID=$!
sleep 2
kill $TCPDUMP_PID 2>/dev/null

echo "Setup complete. Server ready for security assessment."