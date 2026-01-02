#!/bin/bash
# TechCorp Network Challenge Setup Script

echo "Setting up TechCorp Network Reconnaissance Challenge..."

# Install SNMP daemon
sudo apt-get update
sudo apt-get install -y snmpd snmp-mibs-downloader

# Stop SNMP service
sudo systemctl stop snmpd

# Backup original config
sudo cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.backup

# Copy challenge configuration
sudo cp snmpd.conf /etc/snmp/snmpd.conf

# Create data directory
sudo mkdir -p /var/snmp/data
sudo cp network_topology.txt /var/snmp/data/

# Copy MIB file
sudo cp mibs.txt /usr/share/snmp/mibs/TECHCORP-NETWORK-MIB.txt

# Set permissions
sudo chown -R snmp:snmp /var/snmp/data
sudo chmod 644 /etc/snmp/snmpd.conf
sudo chmod 644 /usr/share/snmp/mibs/TECHCORP-NETWORK-MIB.txt

# Configure SNMP to listen on port 23 (Telnet port for misdirection)
sudo sed -i 's/agentAddress udp:161,tcp:161/agentAddress udp:23,tcp:23/' /etc/snmp/snmpd.conf

# Start SNMP service
sudo systemctl start snmpd
sudo systemctl enable snmpd

# Verify service is running
sudo systemctl status snmpd

echo "SNMP service configured and running on port 23"
echo "Use 'snmpwalk -v2c -c public localhost:23' to test"
echo "Challenge setup complete!"