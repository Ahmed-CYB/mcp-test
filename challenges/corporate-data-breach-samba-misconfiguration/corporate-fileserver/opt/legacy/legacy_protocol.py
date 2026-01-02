#!/usr/bin/env python3
import socket
import threading
import time
import base64

# Legacy File Transfer Protocol Server
# Port 20 - Custom Implementation

class LegacyProtocolServer:
    def __init__(self, host='0.0.0.0', port=20):
        self.host = host
        self.port = port
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
        # Debug mode enabled - information disclosure vulnerability
        self.debug_mode = True
        self.system_info = {
            'version': 'LegacyFTP v2.1.4',
            'build': '20190315-debug',
            'admin_key': 'legacy_admin_key_9876',
            'backup_location': '/srv/samba/legacy/system_backup.tar.gz',
            'config_path': '/etc/legacy/config.dat'
        }
        
    def start_server(self):
        self.socket.bind((self.host, self.port))
        self.socket.listen(5)
        print(f"Legacy Protocol Server listening on {self.host}:{self.port}")
        
        while True:
            client_socket, addr = self.socket.accept()
            print(f"Connection from {addr}")
            client_thread = threading.Thread(target=self.handle_client, args=(client_socket,))
            client_thread.start()
    
    def handle_client(self, client_socket):
        try:
            # Send welcome banner with system info
            banner = "220 Welcome to Legacy File Transfer Protocol\n"
            if self.debug_mode:
                banner += f"220-DEBUG: {self.system_info['version']} {self.system_info['build']}\n"
                banner += f"220-DEBUG: Admin key hash: {base64.b64encode(self.system_info['admin_key'].encode()).decode()}\n"
            banner += "220 Service ready\n"
            client_socket.send(banner.encode())
            
            while True:
                data = client_socket.recv(1024).decode().strip()
                if not data:
                    break
                    
                response = self.process_command(data)
                client_socket.send(response.encode())
                
        except Exception as e:
            if self.debug_mode:
                error_msg = f"500 ERROR: {str(e)}\nDEBUG: System paths: {self.system_info}\n"
                client_socket.send(error_msg.encode())
        finally:
            client_socket.close()
    
    def process_command(self, command):
        cmd_parts = command.split()
        if not cmd_parts:
            return "500 Invalid command\n"
            
        cmd = cmd_parts[0].upper()
        
        if cmd == "HELP":
            return "214 Commands: HELP, INFO, LIST, GET, QUIT\n"
        elif cmd == "INFO":
            if self.debug_mode:
                info = "215 System Information:\n"
                for key, value in self.system_info.items():
                    info += f"215-{key}: {value}\n"
                info += "215 End of information\n"
                return info
            return "215 Basic system information available\n"
        elif cmd == "LIST":
            return "150 File listing:\n226 Directory listing complete\n"
        elif cmd == "QUIT":
            return "221 Goodbye\n"
        else:
            return f"502 Command '{cmd}' not implemented\n"

if __name__ == "__main__":
    server = LegacyProtocolServer()
    server.start_server()