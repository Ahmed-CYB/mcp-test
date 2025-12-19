# Dockerfile for FTP server with insecure configuration
FROM debian:buster

RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf

# Add a directory and some files
RUN mkdir -p /srv/ftp/public && \
    echo 'This is a public file.' > /srv/ftp/public/public.txt && \
    echo 'CTF{ftp_config_missteps}' > /srv/ftp/public/flag.txt

# Expose FTP port
EXPOSE 21

# Start vsftpd server
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
