#!/bin/bash
# Setup script for debian-legacy challenge

echo "Setting up Debian Legacy Network Services Challenge..."

# Install required services
apt-get update
apt-get install -y xinetd vsftpd telnetd rsh-server finger

# Create directory structure
mkdir -p /var/ftp/pub
mkdir -p /home/mailuser/admin
mkdir -p /etc/xinetd.d

# Set up FTP anonymous access
chown -R ftp:ftp /var/ftp
chmod 755 /var/ftp/pub

# Create user accounts
useradd -m -s /bin/bash mailuser
echo "mailuser:mail2019" | chpasswd
useradd -m -s /bin/bash legacyuser
echo "legacyuser:legacy123" | chpasswd

# Set file permissions
chown mailuser:mailuser /home/mailuser/admin/secret_key.txt
chmod 600 /home/mailuser/admin/secret_key.txt
chown mailuser:mailuser /home/mailuser/mail_config.txt
chmod 644 /home/mailuser/mail_config.txt
chown ftp:ftp /var/ftp/pub/system_info.txt
chmod 644 /var/ftp/pub/system_info.txt

# Configure xinetd services
cp telnetd.conf /etc/xinetd.d/telnet
cp rshd.conf /etc/xinetd.d/rshell
chmod 644 /etc/xinetd.d/telnet
chmod 644 /etc/xinetd.d/rshell

# Start services
systemctl enable xinetd
systemctl start xinetd
systemctl enable vsftpd
systemctl start vsftpd

# Configure iptables to allow services
iptables -I INPUT -p tcp --dport 21 -j ACCEPT
iptables -I INPUT -p tcp --dport 25 -j ACCEPT
iptables -I INPUT -p tcp --dport 79 -j ACCEPT
iptables -I INPUT -p tcp --dport 514 -j ACCEPT
iptables -I INPUT -p tcp --dport 7 -j ACCEPT
iptables -I INPUT -p tcp --dport 9 -j ACCEPT
iptables -I INPUT -p tcp --dport 19 -j ACCEPT

echo "Debian Legacy challenge setup complete!"
echo "Services running on ports: 21, 25, 79, 514, 7, 9, 19"
echo "Note: Telnet service is running on port 25 (SMTP port) for stealth"