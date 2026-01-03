#!/bin/bash
# Start SNMP service for CTF challenge

# Install SNMP daemon if not present
apt-get update && apt-get install -y snmpd snmp-mibs-downloader

# Copy configuration
cp snmpd.conf /etc/snmp/snmpd.conf

# Create directories and scripts
mkdir -p /usr/local/bin /backup/{config,keys,archives}
cp backup_check.sh /usr/local/bin/
cp list_backups.sh /usr/local/bin/
cp show_config.sh /usr/local/bin/
cp backup.conf /backup/config/
cp master.key /backup/keys/
cp encrypted_docs_20240115.enc /backup/archives/
cp flag_backup_encrypted.dat /backup/archives/

# Set permissions
chmod +x /usr/local/bin/*.sh
chmod 644 /backup/config/*
chmod 600 /backup/keys/*
chmod 644 /backup/archives/*

# Start SNMP daemon on port 29
sudo snmpd -p /var/run/snmpd.pid -c /etc/snmp/snmpd.conf -C -f -Lo -Lf /var/log/snmpd.log udp:29

echo "SNMP service started on port 29"
echo "Use 'snmpwalk -v2c -c public localhost:29' to enumerate"