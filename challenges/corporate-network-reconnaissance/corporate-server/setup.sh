#!/bin/bash

# Corporate Server Setup Script
echo "Setting up Corporate Network Services..."

# Install required packages
apt-get update
apt-get install -y vsftpd apache2 openssh-server telnetd xinetd snmpd mysql-server

# Configure services
systemctl enable vsftpd
systemctl enable apache2
systemctl enable ssh
systemctl enable xinetd
systemctl enable snmpd
systemctl enable mysql

# Set up telnet on port 29
cp /etc/xinetd.d/telnetd.conf /etc/xinetd.d/telnet
sed -i 's/disable = yes/disable = no/' /etc/xinetd.d/telnet
echo 'port = 29' >> /etc/xinetd.d/telnet

# Configure MySQL
mysql -u root < /var/lib/mysql/corporate_users.sql

# Set up guest user for telnet
useradd -m -s /bin/bash guest
echo 'guest:guest123' | chpasswd

# Create flag files
echo 'CTF{network_recon_complete_a8f3d}' > /home/guest/user_flag.txt
echo 'CTF{telnet_root_shell_achieved_9d8f5}' > /root/root_flag.txt

# Set appropriate permissions
chown guest:guest /home/guest/user_flag.txt
chmod 644 /home/guest/user_flag.txt
chmod 600 /root/root_flag.txt

# Start all services
systemctl restart vsftpd
systemctl restart apache2
systemctl restart ssh
systemctl restart xinetd
systemctl restart snmpd
systemctl restart mysql

echo "Corporate server setup complete!"
echo "Services running on:"
echo "- HTTP: Port 80"
echo "- FTP: Port 21"
echo "- SSH: Port 22"
echo "- Telnet: Port 29 (legacy)"
echo "- SNMP: Port 161"
echo "- MySQL: Port 3306"