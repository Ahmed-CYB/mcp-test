FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update and install services
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-server sudo vim nano curl wget git net-tools iputils-ping ca-certificates unzip python3 python3-pip vsftpd  \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/bash kali 2>/dev/null || true && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

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
cp /challenge/vsftpd.conf /etc/vsftpd.conf & && cp /challenge/vsftpd.banner /etc/vsftpd.banner & && cp /challenge/vsftpd.userlist /etc/vsftpd.userlist & && mkdir -p /var/run/vsftpd/empty & && mkdir -p /var/ftp/public && mkdir -p /var/ftp/backups && mkdir -p /var/ftp/admin && chmod 555 /var/ftp && chmod 755 /var/ftp/public && chmod 755 /var/ftp/backups && chmod 755 /var/ftp/admin && cp /challenge/employees.txt /var/ftp/public/ && cp /challenge/system_info.txt /var/ftp/public/ && cp /challenge/backup_manifest.enc /var/ftp/backups/ && cp /challenge/readme.txt /var/ftp/backups/ && cp /challenge/flag.txt /var/ftp/admin/ && cp /challenge/admin_notes.txt /var/ftp/admin/ && cp /challenge/decrypt_manifest.py /var/ftp/admin/ && useradd -m -s /bin/bash backupuser && echo 'backupuser:backup2023' | chpasswd && chown -R ftp:ftp /var/ftp/public && chown -R backupuser:backupuser /var/ftp/backups && chown -R backupuser:backupuser /var/ftp/admin && chmod 644 /var/ftp/public/* && chmod 644 /var/ftp/backups/* && chmod 644 /var/ftp/admin/* && service vsftpd start || /usr/sbin/vsftpd /etc/vsftpd.conf &

# crypto service setup (AI-generated)
service vsftpd start & && mkdir -p /ftp/public /ftp/admin /ftp/backup && chmod 755 /ftp/* && echo 'Corporate FTP server ready for penetration testing'

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21 25 53 1433
CMD ["/start-services.sh"]
