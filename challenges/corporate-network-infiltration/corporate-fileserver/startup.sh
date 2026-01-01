#!/bin/bash
# DataFlow Industries Legacy Server Startup

# Start TFTP service on port 24
sudo systemctl stop tftpd-hpa
sudo systemctl start tftpd-hpa
sudo ufw allow 24/udp

# Configure TFTP directory permissions
sudo chown -R tftp:tftp /srv/tftp
sudo chmod -R 755 /srv/tftp

# Start Samba service
sudo systemctl restart smbd
sudo systemctl restart nmbd
sudo ufw allow 445/tcp
sudo ufw allow 139/tcp

# Set up legacy share permissions
sudo mkdir -p /srv/samba/legacy /srv/samba/public
sudo chown -R nobody:nogroup /srv/samba/legacy
sudo chmod -R 777 /srv/samba/legacy

echo "Legacy services started on DataFlow Industries server"
echo "TFTP: Port 24 (UDP)"
echo "SMB: Ports 139,445 (TCP)"