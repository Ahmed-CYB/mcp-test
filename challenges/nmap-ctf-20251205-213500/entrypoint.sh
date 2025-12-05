#!/bin/bash
service ssh start
service nginx start
service vsftpd start
service smbd start || service samba start
# Dummy TCP service on 9999
while true; do echo "Nmap training port" | nc -l -p 9999; done &
/bin/bash