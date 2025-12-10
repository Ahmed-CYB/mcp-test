#!/bin/bash
set -e

export FW_ADMIN_TOKEN="debug-FTW-2025"

spawn-fcgi -s /run/fcgiwrap/fcgiwrap.sock -U www-data -G www-data /usr/sbin/fcgiwrap
chmod 777 /run/fcgiwrap/fcgiwrap.sock

nginx -g 'daemon off;'
