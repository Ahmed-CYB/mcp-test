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
mkdir -p /var/run/vsftpd/empty && mkdir -p /var/ftp && mkdir -p /srv/ftp/biotech/research/confidential && mkdir -p /srv/ftp/biotech/system && mkdir -p /srv/ftp/biotech/logs && cp /challenge/vsftpd.conf /etc/vsftpd.conf && cp /challenge/flag.txt /srv/ftp/biotech/research/confidential/flag.txt && cp /challenge/research_notes.txt /srv/ftp/biotech/research/research_notes.txt && cp /challenge/protein_data.csv /srv/ftp/biotech/research/protein_data.csv && cp /challenge/backup_service.py /srv/ftp/biotech/system/backup_service.py && cp /challenge/system_log.txt /srv/ftp/biotech/logs/system_log.txt && chmod 755 /var/ftp && chmod 755 /srv/ftp/biotech && chmod 755 /srv/ftp/biotech/research && chmod 755 /srv/ftp/biotech/system && chmod 755 /srv/ftp/biotech/logs && chmod 700 /srv/ftp/biotech/research/confidential && chmod 644 /srv/ftp/biotech/research/confidential/flag.txt && chmod 644 /srv/ftp/biotech/research/research_notes.txt && chmod 644 /srv/ftp/biotech/research/protein_data.csv && chmod 755 /srv/ftp/biotech/system/backup_service.py && chmod 644 /srv/ftp/biotech/logs/system_log.txt && chown -R ftp:ftp /var/ftp && chown -R ftp:ftp /srv/ftp/biotech && python3 /srv/ftp/biotech/system/backup_service.py &  && service vsftpd start || /usr/sbin/vsftpd /etc/vsftpd.conf &

# crypto service setup (AI-generated)
service vsftpd start && echo 'FTP server started on port 21 with anonymous access enabled'

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21 25 53 1433
CMD ["/start-services.sh"]
