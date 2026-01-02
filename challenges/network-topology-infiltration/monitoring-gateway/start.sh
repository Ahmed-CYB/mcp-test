#!/bin/bash
mkdir -p /ftp/public /ftp/data /ftp/private
echo "CTF{network_ftp_anon_d82x0xepiq}" > /ftp/data/flag.txt
chmod 644 /ftp/data/flag.txt
echo "Welcome to the CTF FTP Server!" > /ftp/public/welcome.txt
echo "Important files may be in subdirectories" > /ftp/public/readme.txt
service vsftpd start
tail -f /dev/null