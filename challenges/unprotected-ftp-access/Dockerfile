FROM debian:bookworm-slim

# Install vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

# Configure vsftpd
COPY vsftpd.conf /etc/vsftpd.conf

# Add an FTP user and place the flag
RUN useradd -m ftpuser && \
    echo 'ftpuser:ftpuser' | chpasswd && \
    mkdir -p /home/ftpuser && \
    echo 'CTF{ftp_config_missteps}' > /home/ftpuser/flag.txt && \
    chown ftpuser:ftpuser /home/ftpuser/flag.txt

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]
