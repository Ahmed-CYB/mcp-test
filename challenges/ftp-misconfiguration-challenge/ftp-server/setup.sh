#!/bin/bash
# FTP Server Setup Script

# Install and configure vsftpd
apt-get update
apt-get install -y vsftpd

# Create FTP directory structure
mkdir -p /var/ftp/{public,admin,backups,uploads,admin/.hidden,backups/.ssh}

# Set permissions (misconfigured - too permissive)
chown -R ftp:ftp /var/ftp
chmod -R 755 /var/ftp
chmod 777 /var/ftp/uploads
chmod 644 /var/ftp/admin/users.txt
chmod 600 /var/ftp/backups/.ssh/ssh_private_key

# Copy configuration files
cp vsftpd.conf /etc/vsftpd/
cp welcome.msg /var/ftp/
cp users.txt /var/ftp/admin/
cp flag.txt /var/ftp/admin/.hidden/
cp ssh_private_key /var/ftp/backups/.ssh/

# Create some dummy files
echo "Public files available for download" > /var/ftp/public/readme.txt
echo "Backup completed: $(date)" > /var/ftp/backups/backup.log

# Start services
systemctl enable vsftpd
systemctl start vsftpd
systemctl enable ssh
systemctl start ssh

# Create users from credentials file
useradd -m -s /bin/bash admin
echo 'admin:P@ssw0rd123' | chpasswd
useradd -m -s /bin/bash backup  
echo 'backup:backup2023' | chpasswd
useradd -m -s /bin/bash ftpuser
echo 'ftpuser:Welcome123' | chpasswd

echo "FTP server setup complete!"
echo "Services running on ports 21 (FTP) and 22 (SSH)"