#!/bin/bash

# CorpNet Legacy Web Server Setup
echo "Setting up CorpNet Legacy Web Server..."

# Install required services
apt-get update
apt-get install -y apache2 openssh-server vsftpd mysql-server snmp snmp-mibs-downloader xinetd telnetd

# Configure Apache
systemctl enable apache2
systemctl start apache2

# Configure SSH
systemctl enable ssh
systemctl start ssh

# Configure FTP
systemctl enable vsftpd
systemctl start vsftpd

# Configure MySQL
systemctl enable mysql
systemctl start mysql

# Configure SNMP
systemctl enable snmpd
systemctl start snmpd

# Configure legacy telnet service on port 26
cp /root/telnetd.conf /etc/xinetd.d/telnet
systemctl enable xinetd
systemctl start xinetd

# Create legacy user account
useradd -m -s /bin/bash legacy
echo 'legacy:oldschool123' | chpasswd

# Set file permissions for realistic exposure
chmod 644 /etc/passwd
chmod 640 /etc/shadow
chmod 644 /var/backups/system_backup.txt

# Configure firewall to allow all services
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 21/tcp
ufw allow 26/tcp
ufw allow 3306/tcp
ufw allow 161/udp
ufw --force enable

echo "Setup complete! Legacy telnet service available on port 26"
echo "Use: telnet <server-ip> 26"
echo "Credentials: legacy / oldschool123"