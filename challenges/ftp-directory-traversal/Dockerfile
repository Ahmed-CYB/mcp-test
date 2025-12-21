# FTP server setup using vsftpd
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends vsftpd && \
    rm -rf /var/lib/apt/lists/*

# Copy vsftpd configuration
COPY vsftpd.conf /etc/vsftpd.conf

# Expose FTP port
EXPOSE 21

# Add a flag in the directory
COPY flag.txt /srv/ftp/hidden/flag.txt

# Create FTP user
RUN useradd -m -d /srv/ftp ftpuser && \
    echo 'ftpuser:ftp123' | chpasswd && \
    mkdir -p /srv/ftp/public && \
    chmod -R 755 /srv/ftp

# Start vsftpd
CMD ["vsftpd", "/etc/vsftpd.conf"]