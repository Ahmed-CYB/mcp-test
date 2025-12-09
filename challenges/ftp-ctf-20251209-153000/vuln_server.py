#!/usr/bin/env python3
import socket
import threading
import os

BIND_HOST = "0.0.0.0"
BIND_PORT = 2121

BANNER = b"Vuln FTP Helper Service v1.0\n"

# Intentionally unsafe path handling inspired by directory traversal issues
BASE_DIR = "/"


def handle_client(conn, addr):
    conn.sendall(BANNER)
    try:
        while True:
            conn.sendall(b"CMD> ")
            data = conn.recv(1024)
            if not data:
                break
            cmd = data.decode(errors="ignore").strip()
            if cmd.lower() in ("quit", "exit"):
                break

            if cmd.startswith("READ "):
                path = cmd[5:]
                # Vulnerability: no sanitization of user-supplied path
                full_path = os.path.join(BASE_DIR, path)
                try:
                    with open(full_path, "rb") as f:
                        chunk = f.read(4096)
                    conn.sendall(chunk + b"\n")
                except Exception as e:
                    conn.sendall(b"ERR\n")
            else:
                conn.sendall(b"UNKNOWN CMD\n")
    finally:
        conn.close()


def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((BIND_HOST, BIND_PORT))
    s.listen(5)
    while True:
        conn, addr = s.accept()
        t = threading.Thread(target=handle_client, args=(conn, addr), daemon=True)
        t.start()


if __name__ == "__main__":
    main()
