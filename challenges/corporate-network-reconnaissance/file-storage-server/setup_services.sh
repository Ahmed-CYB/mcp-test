#!/bin/bash
# Setup script for corporate network reconnaissance challenge

echo "Setting up TFTP server..."
sudo apt-get update
sudo apt-get install -y tftpd-hpa xinetd
sudo mkdir -p /var/lib/tftpboot/configs
sudo cp tftpd.conf /etc/xinetd.d/tftp
sudo systemctl enable xinetd
sudo systemctl start xinetd

echo "Setting up FTP server..."
sudo apt-get install -y vsftpd
sudo mkdir -p /var/ftp/pub
sudo cp vsftpd.conf /etc/vsftpd.conf
sudo systemctl enable vsftpd
sudo systemctl start vsftpd

echo "Setting up SMB server..."
sudo apt-get install -y samba
sudo mkdir -p /srv/samba/{public,development,backups}
sudo cp smb.conf /etc/samba/smb.conf
sudo systemctl enable smbd
sudo systemctl start smbd

echo "Setting up NFS server..."
sudo apt-get install -y nfs-kernel-server
sudo mkdir -p /srv/nfs/{shared,projects,backups}
sudo cp exports /etc/exports
sudo exportfs -a
sudo systemctl enable nfs-kernel-server
sudo systemctl start nfs-kernel-server

echo "Setting up SNMP..."
sudo apt-get install -y snmpd
sudo cp snmpd.conf /etc/snmp/snmpd.conf
sudo systemctl enable snmpd
sudo systemctl start snmpd

echo "Copying challenge files..."
sudo cp network_topology.txt /var/lib/tftpboot/configs/
sudo cp snmp_community.txt /var/lib/tftpboot/
sudo cp ip_ranges.txt /srv/samba/development/
sudo cp final_flag.txt /srv/nfs/shared/

echo "Setting permissions..."
sudo chown -R nobody:nogroup /var/lib/tftpboot
sudo chmod -R 755 /var/lib/tftpboot
sudo chown -R nobody:nogroup /srv/samba
sudo chmod -R 755 /srv/samba
sudo chown -R nobody:nogroup /srv/nfs
sudo chmod -R 755 /srv/nfs

echo "Challenge setup complete!"