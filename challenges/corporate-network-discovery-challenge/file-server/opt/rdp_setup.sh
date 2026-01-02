#!/bin/bash
# RDP Service Setup Script
# Configures xrdp with weak encryption for legacy compatibility

apt-get update
apt-get install -y xrdp

# Configure weak encryption for legacy systems
echo "security_layer=rdp" >> /etc/xrdp/xrdp.ini
echo "crypt_level=low" >> /etc/xrdp/xrdp.ini
echo "certificate=" >> /etc/xrdp/xrdp.ini
echo "key_file=" >> /etc/xrdp/xrdp.ini
echo "ssl_protocols=TLSv1" >> /etc/xrdp/xrdp.ini

# Create user for RDP access
useradd -m -s /bin/bash rdpuser
echo "rdpuser:admin123" | chpasswd

# Add flag to user directory
echo "CTF{rdp_weak_encryption_exposed_2d5a8f1e}" > /home/rdpuser/flag3.txt
chown rdpuser:rdpuser /home/rdpuser/flag3.txt

# Start service
systemctl enable xrdp
systemctl start xrdp

# Configure firewall
ufw allow 3389/tcp

echo "RDP service configured on port 3389 with weak encryption"
echo "Username: rdpuser"
echo "Password: admin123"