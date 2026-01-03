#!/usr/bin/env python3
# Emergency Backup Service - Port 23
# Provides telnet-like access for system recovery

import socket
import subprocess
import threading
import os

class BackupService:
    def __init__(self, port=23):
        self.port = port
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
    def handle_client(self, client_socket, addr):
        try:
            client_socket.send(b"BioTech Emergency Backup System v1.2\r\n")
            client_socket.send(b"Login: ")
            username = client_socket.recv(1024).decode().strip()
            client_socket.send(b"Password: ")
            password = client_socket.recv(1024).decode().strip()
            
            # Weak authentication - default credentials
            if username == "backup" and password == "biotech123":
                client_socket.send(b"Access granted. Emergency shell activated.\r\n")
                client_socket.send(b"backup@biotech:~$ ")
                
                while True:
                    cmd = client_socket.recv(1024).decode().strip()
                    if cmd.lower() in ['exit', 'quit']:
                        break
                    
                    if cmd == "help":
                        help_text = b"Available commands: ls, cat, find, pwd, help, exit\r\n"
                        client_socket.send(help_text)
                    elif cmd.startswith("cat "):
                        filepath = cmd[4:]
                        try:
                            with open(filepath, 'r') as f:
                                content = f.read()
                                client_socket.send(content.encode() + b"\r\n")
                        except:
                            client_socket.send(b"File not found or access denied\r\n")
                    elif cmd == "ls":
                        client_socket.send(b"research/  system/  logs/\r\n")
                    elif cmd == "pwd":
                        client_socket.send(b"/srv/ftp/biotech\r\n")
                    elif cmd.startswith("find "):
                        search_term = cmd[5:]
                        if "flag" in search_term.lower():
                            client_socket.send(b"./research/confidential/flag.txt\r\n")
                        else:
                            client_socket.send(b"No files found\r\n")
                    else:
                        client_socket.send(b"Command not recognized. Type 'help' for available commands.\r\n")
                    
                    client_socket.send(b"backup@biotech:~$ ")
            else:
                client_socket.send(b"Access denied. Invalid credentials.\r\n")
                
        except:
            pass
        finally:
            client_socket.close()
            
    def start(self):
        self.socket.bind(('0.0.0.0', self.port))
        self.socket.listen(5)
        print(f"Backup service listening on port {self.port}")
        
        while True:
            client_socket, addr = self.socket.accept()
            client_thread = threading.Thread(
                target=self.handle_client, 
                args=(client_socket, addr)
            )
            client_thread.daemon = True
            client_thread.start()

if __name__ == "__main__":
    service = BackupService()
    service.start()