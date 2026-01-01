#!/bin/bash
# Start all IoT device services

echo "Starting Corporate IoT Device Services..."

# Start xinetd for telnet service
sudo service xinetd restart
echo "Telnet service started on port 28"

# Start HTTP server
cd /opt/corporate/services
python3 http_server.py &
echo "HTTP service started on port 8080"

# Start CoAP service
python3 coap_server.py &
echo "CoAP service started on port 5683"

# Start UPnP service
python3 upnp_service.py &
echo "UPnP service started"

# Start TFTP server
sudo service tftpd-hpa start
echo "TFTP service started on port 69"

# Start backdoor management service
python3 backdoor_service.py &
echo "Management service started on port 9999"

echo "All services started successfully!"
echo "Device ready for corporate network assessment."