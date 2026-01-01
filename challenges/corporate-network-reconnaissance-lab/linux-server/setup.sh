#!/bin/bash
# Setup script for SSH legacy challenge

# Install OpenSSH server
sudo apt update
sudo apt install -y openssh-server

# Stop SSH service
sudo systemctl stop ssh

# Backup original config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Copy custom configuration
sudo cp sshd_config /etc/ssh/sshd_config
sudo cp banner /etc/ssh/banner

# Set proper permissions
sudo chmod 644 /etc/ssh/sshd_config
sudo chmod 644 /etc/ssh/banner

# Create users with weak passwords
sudo useradd -m -s /bin/bash finance
sudo useradd -m -s /bin/bash legacy_admin
sudo useradd -m -s /bin/bash audit

# Set passwords (weak for demonstration)
echo 'finance:1987Finance' | sudo chpasswd
echo 'legacy_admin:legacy123' | sudo chpasswd
echo 'audit:audit2023' | sudo chpasswd

# Copy user files
sudo cp financial_data.txt /home/finance/
sudo cp legacy_notes.md /home/legacy_admin/
sudo chown finance:finance /home/finance/financial_data.txt
sudo chown legacy_admin:legacy_admin /home/legacy_admin/legacy_notes.md
sudo chmod 600 /home/finance/financial_data.txt
sudo chmod 640 /home/legacy_admin/legacy_notes.md

# Generate SSH host keys for Protocol 1
sudo ssh-keygen -t rsa1 -f /etc/ssh/ssh_host_key -N ''
sudo ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
sudo ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''

# Start SSH service on port 25
sudo systemctl start ssh

echo "SSH Legacy Challenge setup complete!"
echo "SSH service running on port 25 with Protocol 1"
echo "Test with: ssh -1 -p 25 finance@localhost"