#!/bin/bash

# Network Appliance Service Setup Script
# Corporate Network Reconnaissance Lab

echo "Setting up Corporate Network Appliance services..."

# Create necessary directories
sudo mkdir -p /var/log/ntpstats
sudo mkdir -p /var/log/network-security
sudo mkdir -p /etc/ntp
sudo mkdir -p /var/spool/rsyslog

# SSH Service Configuration
echo "Configuring SSH service..."
sudo cp sshd_config /etc/ssh/sshd_config
sudo cp ssh_banner /etc/ssh/ssh_banner
sudo chmod 644 /etc/ssh/sshd_config /etc/ssh/ssh_banner

# Create network users
sudo useradd -m -s /bin/bash netadmin
sudo useradd -m -s /bin/bash backup
sudo useradd -m -s /bin/bash monitoring
echo "netadmin:netw0rk@dm1n" | sudo chpasswd
echo "backup:b4ckup2024!" | sudo chpasswd
echo "monitoring:m0n1t0r123" | sudo chpasswd

# SNMP Service Configuration
echo "Configuring SNMP service..."
sudo cp snmpd.conf /etc/snmp/snmpd.conf
sudo chmod 600 /etc/snmp/snmpd.conf

# NTP Service Configuration
echo "Configuring NTP service..."
sudo cp ntp.conf /etc/ntp.conf
sudo chmod 644 /etc/ntp.conf

# Create NTP keys file
sudo cat > /etc/ntp/keys << 'EOF'
# NTP Keys
42 M secretkey123!
EOF
sudo chmod 600 /etc/ntp/keys

# Syslog Service Configuration
echo "Configuring Syslog service..."
sudo cp rsyslog.conf /etc/rsyslog.conf
sudo chmod 644 /etc/rsyslog.conf

# DHCP Service Configuration
echo "Configuring DHCP service..."
sudo cp dhcpd.conf /etc/dhcp/dhcpd.conf
sudo chmod 644 /etc/dhcp/dhcpd.conf

# Create DHCP local config
sudo cat > /etc/dhcp/dhcpd.local.conf << 'EOF'
# Local DHCP configuration
# Additional host reservations and options
EOF

# Create network security log with flag
echo "Setting up monitoring logs..."
sudo cp network-security.log /var/log/network-security.log
sudo chmod 644 /var/log/network-security.log

# Set up log rotation
sudo cat > /etc/logrotate.d/network-appliance << 'EOF'
/var/log/network-security.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 644 syslog syslog
}
EOF

# Restart services
echo "Starting services..."
sudo systemctl restart ssh
sudo systemctl restart snmpd
sudo systemctl restart ntp
sudo systemctl restart rsyslog
sudo systemctl restart isc-dhcp-server

# Enable services
sudo systemctl enable ssh
sudo systemctl enable snmpd
sudo systemctl enable ntp
sudo systemctl enable rsyslog
sudo systemctl enable isc-dhcp-server

# Configure firewall
echo "Configuring firewall rules..."
sudo ufw allow 22/tcp
sudo ufw allow 161/udp
sudo ufw allow 123/udp
sudo ufw allow 514/udp
sudo ufw allow 67/udp
sudo ufw allow 68/udp

# Set up network interfaces
echo "Configuring network interfaces..."
sudo cat >> /etc/network/interfaces << 'EOF'

# Management interface
auto eth1
iface eth1 inet static
address 10.10.10.100
netmask 255.255.255.0
gateway 10.10.10.1

# Monitoring interface
auto eth2
iface eth2 inet static
address 172.16.1.10
netmask 255.255.255.0
EOF

echo "Network Appliance setup complete!"
echo "Services configured: SSH (22), SNMP (161), NTP (123), Syslog (514), DHCP (67/68)"
echo "Use nmap from scanner-workstation to discover and enumerate services"
echo "Check system logs for monitoring information"