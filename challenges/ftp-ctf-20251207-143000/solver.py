#!/usr/bin/env python3
import ftplib

HOST = "localhost"
PORT = 21

# Anonymous FTP login and retrieve the flag
ftp = ftplib.FTP()
ftp.connect(HOST, PORT, timeout=10)
ftp.login()
ftp.cwd("pub")

flag_contents = []
ftp.retrlines("RETR flag.txt", flag_contents.append)
ftp.quit()

print("".join(flag_contents))
