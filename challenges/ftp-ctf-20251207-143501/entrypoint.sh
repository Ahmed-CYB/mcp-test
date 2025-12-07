#!/bin/bash
set -e

# Ensure vsftpd runtime directories
mkdir -p /var/run/vsftpd/empty

# Start vsftpd in foreground
/usr/sbin/vsftpd /etc/vsftpd.conf
