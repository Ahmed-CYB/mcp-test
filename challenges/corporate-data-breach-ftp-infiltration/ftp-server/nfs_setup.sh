#!/bin/bash
# NFS Server Setup Script

sudo apt-get update
sudo apt-get install -y nfs-kernel-server

# Create directories
sudo mkdir -p /var/nfs/general
sudo mkdir -p /home/staging
sudo mkdir -p /opt/company_data
sudo mkdir -p /tmp/shared

# Set permissions
sudo chown nobody:nogroup /var/nfs/general
sudo chown nobody:nogroup /home/staging
sudo chown nobody:nogroup /opt/company_data
sudo chmod 777 /tmp/shared

# Copy exports configuration
sudo cp exports /etc/exports

# Restart NFS services
sudo systemctl restart nfs-kernel-server
sudo exportfs -a

# Configure custom port 29
sudo sed -i 's/#RPCNFSDOPTS=""/RPCNFSDOPTS="-p 29"/' /etc/default/nfs-kernel-server
sudo systemctl restart nfs-kernel-server

echo "NFS server configured on port 29 with anonymous access enabled"