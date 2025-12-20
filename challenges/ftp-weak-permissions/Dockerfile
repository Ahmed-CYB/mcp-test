# Setup FTP server with weak permissions
FROM debian:bookworm-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends vsftpd && \
    rm -rf /var/lib/apt/lists/*
COPY vsftpd.conf /etc/vsftpd.conf
COPY ftp-data/ /srv/ftp/
RUN chmod -R 777 /srv/ftp
CMD ["vsftpd", "/etc/vsftpd.conf"]
EXPOSE 21
