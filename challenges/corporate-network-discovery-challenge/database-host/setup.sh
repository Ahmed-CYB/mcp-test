#!/bin/bash

# Corporate Network Discovery Challenge Setup
echo "Setting up Corporate Network Challenge..."

# Install required services
apt-get update
apt-get install -y xinetd telnetd mysql-server bind9 nmap

# Setup custom info service
chmod +x /usr/local/bin/info-server
cp /etc/xinetd.d/xinetd.conf /etc/xinetd.d/custom-info
systemctl enable xinetd
systemctl restart xinetd

# Configure telnet
cp /etc/xinetd.d/telnet.conf /etc/xinetd.d/telnet
systemctl restart xinetd

# Setup MySQL
systemctl start mysql
mysql < /tmp/mysql_setup.sql
systemctl enable mysql

# Configure DNS
cp /etc/bind/named.conf /etc/bind/named.conf.backup
cp /etc/bind/named.conf /etc/bind/
cp /etc/bind/db.corp.local /etc/bind/
cp /etc/bind/db.192.168.100 /etc/bind/
chown bind:bind /etc/bind/db.*
systemctl restart bind9
systemctl enable bind9

# Configure network interface
ip addr add 192.168.100.10/24 dev eth0
echo "192.168.100.10 database-host database-host.corp.local" >> /etc/hosts

# Set up firewall rules to allow services
ufw allow 23/tcp
ufw allow 26/tcp
ufw allow 53/tcp
ufw allow 53/udp
ufw allow 3306/tcp

echo "Setup complete! Services running on:"
echo "- Custom Info Service: port 26"
echo "- Telnet: port 23"
echo "- MySQL: port 3306"
echo "- DNS: port 53"
echo ""
echo "Network discovery target: 192.168.100.0/24"
echo "Primary host: database-host (192.168.100.10)"