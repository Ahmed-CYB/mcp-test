#!/usr/bin/env python3
import socket
import threading
import time

def handle_client(client_socket, address):
    try:
        # Custom protocol - responds to null authentication
        client_socket.send(b"CORPORATE MONITOR v1.2\n")
        client_socket.send(b"AUTH: ")
        
        auth_data = client_socket.recv(1024)
        
        # Allow null/empty authentication
        if not auth_data.strip() or auth_data.strip() == b"null":
            client_socket.send(b"ACCESS GRANTED - GUEST MODE\n")
            client_socket.send(b"NETWORK STATUS: 3 servers active\n")
            client_socket.send(b"HINT: Check SNMP community 'corporate' on .20.25\n")
            client_socket.send(b"SERVICE INFO: Custom protocol allows null sessions\n")
        else:
            client_socket.send(b"ACCESS DENIED\n")
            
    except Exception as e:
        pass
    finally:
        client_socket.close()

def start_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind(('0.0.0.0', 28))
    server.listen(5)
    
    print("Custom monitor service started on port 28")
    
    while True:
        client, address = server.accept()
        client_thread = threading.Thread(target=handle_client, args=(client, address))
        client_thread.start()

if __name__ == "__main__":
    start_server()