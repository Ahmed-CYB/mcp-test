#!/bin/bash
# Network security challenge setup script

echo "Setting up Corporate Network Reconnaissance challenge..."

# Install required services
apt-get update
apt-get install -y telnetd xinetd snmp snmp-mibs-downloader openssh-server

# Configure xinetd for telnet and legacy mail
cp telnetd.conf /etc/xinetd.d/
chmod +x /opt/legacy/legacy-mail-server
chown mailuser:mailuser /opt/legacy/legacy-mail-server

# Configure SNMP
cp snmpd.conf /etc/snmp/
systemctl enable snmpd
systemctl restart snmpd

# Configure SSH
cp sshd_config /etc/ssh/
cp ssh_banner /etc/ssh/
systemctl restart ssh

# Set up user accounts with weak passwords for CTF
echo 'netadmin:network123' | chpasswd
echo 'sysoperator:operator456' | chpasswd  
echo 'legacyuser:legacy789' | chpasswd
echo 'mailuser:mail2024' | chpasswd

# Create legacy mail data directory
mkdir -p /opt/legacy/data
cp network_topology.txt /opt/legacy/data/
echo 'CTF{n3tw0rk_r3c0nn4155anc3_m45t3r_d15c0v3r3d}' > /opt/legacy/data/flag.txt
chown -R mailuser:mailuser /opt/legacy/

# Start services
systemctl enable xinetd
systemctl restart xinetd

# Configure firewall to allow challenge ports
ufw allow 22/tcp
ufw allow 23/tcp  
ufw allow 25/tcp
ufw allow 161/udp

echo "Challenge setup complete!"
echo "Services running on:"
echo "- SSH: port 22 (users: netadmin/network123, sysoperator/operator456)"
echo "- Telnet: port 23"
echo "- Legacy Mail: port 25 (vulnerable to directory traversal)"
echo "- SNMP: port 161 (community: public)"
echo ""  
echo "Network topology: 192.168.10.50, 192.168.10.75, 192.168.10.100"
echo "Flag hidden in legacy mail server data directory"