#!/bin/sh
service vsftpd stop 2>/dev/null || true
/usr/sbin/vsftpd /etc/vsftpd.conf
