# Simple network protocol server
# Vulnerability: Unauthorized data extraction due to misconfiguration
import socket

HOST = '0.0.0.0'
PORT = 8080

FLAG = 'CTF{unauthorized_data_extraction}'

# Simulated sensitive data
sensitive_data = {
    'username': 'admin',
    'password': 'supersecret',
    'flag': FLAG
}

def handle_client_connection(client_socket):
    with client_socket:
        print('Connected by', client_socket.getpeername())
        while True:
            data = client_socket.recv(1024)
            if not data:
                break
            if data.decode() == 'GET FLAG':
                response = sensitive_data['flag']
            else:
                response = 'INVALID COMMAND'
            client_socket.sendall(response.encode())

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen()
        print(f'Server listening on {HOST}:{PORT}')
        while True:
            conn, addr = s.accept()
            handle_client_connection(conn)

if __name__ == '__main__':
    main()
