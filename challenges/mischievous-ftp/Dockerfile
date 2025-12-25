FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    vsftpd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY vsftpd.conf /etc/vsftpd.conf
COPY ftp_data/ /srv/ftp/
RUN chmod -R 755 /srv/ftp/
EXPOSE 21
CMD ["vsftpd", "/etc/vsftpd.conf"]