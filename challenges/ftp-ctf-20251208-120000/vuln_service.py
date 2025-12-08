#!/usr/bin/env python3
import os
import socket

HOST = '0.0.0.0'
PORT = 5000

BASE_DIR = '/opt/vulnapp'
FTP_DROP = '/var/ftp/uploads'
FLAG_PATH = os.path.join(BASE_DIR, 'flag.txt')

os.makedirs(FTP_DROP, exist_ok=True)

# Create a fake flag
if not os.path.exists(FLAG_PATH):
    with open(FLAG_PATH, 'w') as f:
        f.write('CTF{dummy_flag_replace_in_real_deploy}')

# Vulnerable function: trusts filenames dropped via FTP uploads directory

def handle_client(conn):
    conn.sendall(b'Welcome to vuln service. Send filename to read.\n')
    data = conn.recv(1024).strip().decode('utf-8', errors='ignore')
    if not data:
        conn.close()
        return
    requested = data
    # Vulnerability: path traversal using uploaded symlinks from FTP
    full_path = os.path.join(FTP_DROP, requested)
    try:
        with open(full_path, 'r') as f:
            content = f.read(4096)
        conn.sendall(content.encode() + b"\n")
    except Exception as e:
        conn.sendall(f'Error: {e}'.encode() + b"\n")
    conn.close()


def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((HOST, PORT))
    s.listen(5)
    while True:
        conn, addr = s.accept()
        handle_client(conn)


if __name__ == '__main__':
    main()
