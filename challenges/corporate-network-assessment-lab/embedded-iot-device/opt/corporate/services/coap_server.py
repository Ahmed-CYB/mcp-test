#!/usr/bin/env python3
# CoAP Service for IoT Device Management
# Runs on port 5683

import socket
import threading
import time

class SimpleCoapServer:
    def __init__(self, host='0.0.0.0', port=5683):
        self.host = host
        self.port = port
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind((host, port))
        
    def handle_request(self, data, addr):
        # Simple CoAP-like response
        if b'device' in data:
            response = b"IoT Device X200 - Firmware v3.2.1"
        elif b'status' in data:
            response = b"Status: Online, Services: telnet:28, http:8080, backdoor:9999"
        else:
            response = b"CoAP Service Ready - Try 'device' or 'status'"
            
        self.sock.sendto(response, addr)
        
    def run(self):
        print(f"CoAP server listening on {self.host}:{self.port}")
        while True:
            try:
                data, addr = self.sock.recvfrom(1024)
                threading.Thread(target=self.handle_request, args=(data, addr)).start()
            except Exception as e:
                print(f"Error: {e}")

if __name__ == "__main__":
    server = SimpleCoapServer()
    server.run()