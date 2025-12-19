# Use a lightweight FTP server
FROM debian:bookworm-slim

# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

# Copy configuration and flag
COPY vsftpd.conf /etc/vsftpd.conf
COPY flag.txt /srv/ftp/flag.txt

# Expose FTP port
EXPOSE 21

# Start the vsftpd service
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
