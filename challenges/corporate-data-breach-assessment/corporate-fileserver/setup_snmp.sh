#!/bin/bash
# Setup script for SNMP service challenge

# Install SNMP daemon
sudo apt-get update
sudo apt-get install -y snmpd snmp-mibs-downloader

# Create directories
sudo mkdir -p /var/ftp/confidential
sudo mkdir -p /usr/local/bin

# Copy configuration files
sudo cp snmpd.conf /etc/snmp/
sudo cp showflag.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/showflag.sh
sudo cp employees.db /var/ftp/confidential/

# Configure SNMP to listen on port 27
sudo sed -i 's/agentAddress  udp:127.0.0.1:161/agentAddress  udp:0.0.0.0:27/' /etc/snmp/snmpd.conf

# Start SNMP service
sudo systemctl enable snmpd
sudo systemctl start snmpd

# Configure firewall to allow SNMP on port 27
sudo ufw allow 27/udp

echo "SNMP service configured on port 27"
echo "Test with: snmpwalk -v2c -c public localhost:27 system"