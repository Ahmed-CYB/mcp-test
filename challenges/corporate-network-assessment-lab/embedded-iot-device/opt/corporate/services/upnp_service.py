#!/usr/bin/env python3
# UPnP Service for Device Discovery
# Responds to M-SEARCH requests

import socket
import threading

class UPnPService:
    def __init__(self):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.bind(('239.255.255.250', 1900))
        
        # Join multicast group
        mreq = socket.inet_aton('239.255.255.250') + socket.inet_aton('0.0.0.0')
        self.sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
        
    def handle_msearch(self, data, addr):
        if b'M-SEARCH' in data and b'ssdp:discover' in data:
            response = (
                "HTTP/1.1 200 OK\r\n"
                "CACHE-CONTROL: max-age=120\r\n"
                "DATE: Mon, 15 Jan 2024 10:30:00 GMT\r\n"
                "EXT:\r\n"
                "LOCATION: http://192.168.1.100:8080/description.xml\r\n"
                "OPT: \"http://schemas.upnp.org/upnp/1/0/\"; ns=01\r\n"
                "01-NLS: 1\r\n"
                "SERVER: Linux/3.14 UPnP/1.0 EmbeddedIoT-X200/3.2.1\r\n"
                "ST: upnp:rootdevice\r\n"
                "USN: uuid:12345678-1234-1234-1234-123456789abc::upnp:rootdevice\r\n"
                "\r\n"
            ).encode()
            
            sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            sock.sendto(response, addr)
            sock.close()
            
    def run(self):
        print("UPnP service listening for M-SEARCH requests")
        while True:
            try:
                data, addr = self.sock.recvfrom(1024)
                threading.Thread(target=self.handle_msearch, args=(data, addr)).start()
            except Exception as e:
                print(f"UPnP Error: {e}")

if __name__ == "__main__":
    service = UPnPService()
    service.run()