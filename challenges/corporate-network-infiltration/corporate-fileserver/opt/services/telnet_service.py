#!/usr/bin/env python3
import socket
import threading
import base64
import hashlib

class TelnetService:
    def __init__(self, port=23):
        self.port = port
        self.users = {
            'admin': 'TechCorp2023!',
            'backup_admin': 'Backup2023!Corp',
            'guest': 'guest123'
        }
        self.flag_key = 'corporate_master_key_2023'
        
    def handle_client(self, client_socket, addr):
        try:
            client_socket.send(b'TechCorp Internal Management Console\r\n')
            client_socket.send(b'Login: ')
            username = client_socket.recv(1024).decode().strip()
            
            client_socket.send(b'Password: ')
            password = client_socket.recv(1024).decode().strip()
            
            if username in self.users and self.users[username] == password:
                client_socket.send(b'\r\nLogin successful!\r\n')
                client_socket.send(b'TechCorp Management Shell v1.2\r\n')
                
                if username == 'admin':
                    client_socket.send(b'Admin privileges granted\r\n')
                    client_socket.send(b'Available commands: status, backup, flag, exit\r\n')
                    
                    while True:
                        client_socket.send(b'admin@techcorp:~$ ')
                        command = client_socket.recv(1024).decode().strip()
                        
                        if command == 'status':
                            client_socket.send(b'System Status: Online\r\n')
                            client_socket.send(b'FTP Service: Active (Port 21)\r\n')
                            client_socket.send(b'SMB Service: Active (Port 445)\r\n')
                            client_socket.send(b'Backup Service: Scheduled\r\n')
                        elif command == 'backup':
                            client_socket.send(b'Backup configuration:\r\n')
                            client_socket.send(b'SMB Share: //corporate-fileserver/internal_docs\r\n')
                            client_socket.send(b'Credentials: backup_admin:Backup2023!Corp\r\n')
                        elif command == 'flag':
                            encrypted_flag = self.encrypt_flag()
                            client_socket.send(f'Encrypted flag: {encrypted_flag}\r\n'.encode())
                            client_socket.send(b'Decryption key hint: Check the master key in system configs\r\n')
                        elif command == 'exit':
                            break
                        else:
                            client_socket.send(b'Unknown command\r\n')
                else:
                    client_socket.send(b'Limited user access\r\n')
                    client_socket.send(b'Available commands: help, exit\r\n')
                    
            else:
                client_socket.send(b'Login failed\r\n')
                
        except Exception as e:
            print(f'Error handling client {addr}: {e}')
        finally:
            client_socket.close()
    
    def encrypt_flag(self):
        flag = 'CTF{t3lnet_pr1v_3sc_sm6_cr3ds_l34k}'
        key = hashlib.sha256(self.flag_key.encode()).digest()
        encrypted = ''
        for i, char in enumerate(flag):
            encrypted += chr(ord(char) ^ key[i % len(key)])
        return base64.b64encode(encrypted.encode()).decode()
    
    def start_server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server_socket.bind(('0.0.0.0', self.port))
        server_socket.listen(5)
        
        print(f'Telnet service listening on port {self.port}')
        
        while True:
            client_socket, addr = server_socket.accept()
            print(f'Connection from {addr}')
            client_thread = threading.Thread(
                target=self.handle_client,
                args=(client_socket, addr)
            )
            client_thread.start()

if __name__ == '__main__':
    service = TelnetService()
    service.start_server()