# Multi-stage build for FTP server setup
FROM ubuntu:22.04

# Install vsftpd
RUN apt-get update && apt-get install -y vsftpd

# Configure vsftpd
RUN echo 'listen=YES' >> /etc/vsftpd.conf && \
    echo 'anonymous_enable=YES' >> /etc/vsftpd.conf && \
    echo 'anon_upload_enable=YES' >> /etc/vsftpd.conf && \
    echo 'anon_mkdir_write_enable=YES' >> /etc/vsftpd.conf && \
    echo 'anon_root=/var/ftp' >> /etc/vsftpd.conf && \
    echo 'pasv_min_port=40000' >> /etc/vsftpd.conf && \
    echo 'pasv_max_port=40005' >> /etc/vsftpd.conf && \
    mkdir -p /var/ftp

# Add the flag
RUN echo 'CTF{ftp_backdoor_exposed}' > /var/ftp/flag.txt

# Expose FTP port
EXPOSE 21

# Start vsftpd
CMD ["vsftpd", "/etc/vsftpd.conf"]