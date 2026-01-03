FROM archlinux:latest

# Update and install services
RUN pacman -Sy --noconfirm \
    openssh sudo vim nano curl wget git net-tools iputils vsftpd \
    && pacman -Scc --noconfirm


# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config 2>/dev/null || \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config 2>/dev/null || \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

# ✅ FIX: Copy challenge files into container (if they exist in build context)
# Note: Files are copied from the machine-specific directory (e.g., ftp-server/)
COPY . /challenge/

# ✅ FIX: Create dynamic startup script using heredoc (properly handles multi-line scripts)
RUN cat > /start-services.sh << 'EOFSCRIPT'
#!/bin/bash
set -e

# ftp service setup (AI-generated)
cp /challenge/vsftpd.conf /etc/vsftpd.conf & && mkdir -p /var/run/vsftpd/empty & && mkdir -p /var/ftp/public/backup && mkdir -p /var/ftp/secure/backups && chmod 555 /var/ftp && chmod 755 /var/ftp/public && chmod 755 /var/ftp/public/backup && chmod 700 /var/ftp/secure && chmod 700 /var/ftp/secure/backups && cp /challenge/readme.txt /var/ftp/public/readme.txt && cp /challenge/credentials.txt /var/ftp/public/backup/credentials.txt && cp /challenge/maintenance_log.txt /var/ftp/public/backup/maintenance_log.txt && cp /challenge/project_data.enc /var/ftp/secure/backups/project_data.enc && chmod 644 /var/ftp/public/readme.txt && chmod 644 /var/ftp/public/backup/credentials.txt && chmod 644 /var/ftp/public/backup/maintenance_log.txt && chmod 600 /var/ftp/secure/backups/project_data.enc && useradd -m -s /bin/bash projectmgr && echo 'projectmgr:Blueprint2024!' | chpasswd && useradd -m -s /bin/bash contractor && echo 'contractor:BuildSafe99' | chpasswd && useradd -m -s /bin/bash backup_svc && echo 'backup_svc:BackupSys123' | chpasswd && chown -R ftp:ftp /var/ftp/public && chown -R projectmgr:projectmgr /var/ftp/secure && service vsftpd start || /usr/sbin/vsftpd &

# crypto service setup (AI-generated)
service vsftpd start & && echo 'FTP server started with encrypted blueprint files ready for decryption challenge'

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21 23 25 53 1433
CMD ["/start-services.sh"]
