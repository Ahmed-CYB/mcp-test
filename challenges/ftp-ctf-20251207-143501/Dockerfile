FROM debian:stable-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      vsftpd python3 python3-pip netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Create ftp user and directories
RUN useradd -m -d /home/ftpuser -s /bin/bash ftpuser && echo 'ftpuser:ftpuser123' | chpasswd
RUN mkdir -p /var/ftp/pub /var/ftp/private && chown -R ftpuser:ftpuser /var/ftp

# Copy vulnerable config and challenge files
COPY vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /entrypoint.sh
COPY flag.txt /var/ftp/private/flag.txt

RUN chmod +x /entrypoint.sh && chown -R ftpuser:ftpuser /var/ftp/private

EXPOSE 21

CMD ["/entrypoint.sh"]
