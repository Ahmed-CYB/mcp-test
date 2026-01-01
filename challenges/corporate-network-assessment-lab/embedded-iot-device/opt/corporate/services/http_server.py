#!/usr/bin/env python3
# Simple HTTP server for IoT device management
# Port 8080

import http.server
import socketserver
import os

class IoTHTTPHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            html = """
            <html><head><title>IoT Device Management</title></head>
            <body>
            <h1>EmbeddedIoT-X200 Management Interface</h1>
            <p>Device Status: Online</p>
            <p>Firmware: v3.2.1-corporate</p>
            <p>Available Services:</p>
            <ul>
            <li>Telnet Console: Port 28</li>
            <li>CoAP Service: Port 5683</li>
            <li>TFTP Server: Port 69</li>
            <li>UPnP Discovery: Enabled</li>
            <li>Management Service: Port 9999</li>
            </ul>
            <p><a href="/description.xml">Device Description</a></p>
            </body></html>
            """
            self.wfile.write(html.encode())
        elif self.path == '/description.xml':
            self.send_response(200)
            self.send_header('Content-type', 'text/xml')
            self.end_headers()
            xml = """
            <?xml version="1.0"?>
            <root xmlns="urn:schemas-upnp-org:device-1-0">
                <device>
                    <deviceType>urn:schemas-upnp-org:device:EmbeddedIoT:1</deviceType>
                    <friendlyName>Corporate IoT Device X200</friendlyName>
                    <manufacturer>SecureIoT Corp</manufacturer>
                    <modelName>EmbeddedIoT-X200</modelName>
                    <modelNumber>3.2.1</modelNumber>
                    <serialNumber>X200-2023-4A7B9C</serialNumber>
                    <UDN>uuid:12345678-1234-1234-1234-123456789abc</UDN>
                    <serviceList>
                        <service>
                            <serviceType>urn:corporate:service:management:1</serviceType>
                            <serviceId>urn:corporate:serviceId:management</serviceId>
                            <controlURL>/control</controlURL>
                            <eventSubURL>/events</eventSubURL>
                            <SCPDURL>/service.xml</SCPDURL>
                        </service>
                    </serviceList>
                </device>
            </root>
            """
            self.wfile.write(xml.encode())
        else:
            super().do_GET()

if __name__ == "__main__":
    PORT = 8080
    os.chdir('/opt/corporate/www')
    with socketserver.TCPServer(("", PORT), IoTHTTPHandler) as httpd:
        print(f"HTTP server serving at port {PORT}")
        httpd.serve_forever()