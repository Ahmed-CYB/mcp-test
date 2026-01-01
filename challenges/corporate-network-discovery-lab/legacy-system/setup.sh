#!/bin/bash
# Setup script for Legacy Corporate Network Discovery Lab

echo "Setting up Legacy Corporate Network Discovery Lab..."

# Install required services
apt update
apt install -y vsftpd telnetd apache2 snmpd tftpd-hpa xinetd

# Configure FTP service
systemctl stop vsftpd
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak

# Create FTP directory structure
mkdir -p /srv/ftp/public
mkdir -p /srv/ftp/admin
chown -R ftp:ftp /srv/ftp
chmod 755 /srv/ftp/public
chmod 700 /srv/ftp/admin

# Configure TFTP
mkdir -p /srv/tftp
chown -R nobody:nogroup /srv/tftp
chmod 755 /srv/tftp

# Configure SNMP
systemctl stop snmpd
cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.bak

# Configure web server
systemctl stop apache2

# Configure xinetd for telnet and tftp
systemctl stop xinetd
cp /etc/inetd.conf /etc/inetd.conf.bak

# Create user accounts
useradd -m -s /bin/bash legacyuser
useradd -m -s /bin/bash service_account
useradd -m -s /bin/bash backup_user

# Set weak passwords
echo 'legacyuser:legacy123' | chpasswd
echo 'service_account:service456' | chpasswd
echo 'backup_user:backup789' | chpasswd

# Start services
systemctl enable --now vsftpd
systemctl enable --now apache2
systemctl enable --now snmpd
systemctl enable --now xinetd

# Configure firewall to allow services
ufw allow 21/tcp
ufw allow 23/tcp
ufw allow 69/udp
ufw allow 80/tcp
ufw allow 161/udp

echo "Setup complete! Legacy Corporate Network Discovery Lab is ready."
echo "Services running on ports: 21 (FTP), 23 (Telnet), 69 (TFTP), 80 (HTTP), 161 (SNMP)"
echo "Use nmap to discover and enumerate all services for complete network mapping."