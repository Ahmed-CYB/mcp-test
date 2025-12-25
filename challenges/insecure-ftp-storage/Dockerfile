FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
COPY flag.txt /srv/ftp/flag.txt

RUN chmod 644 /srv/ftp/flag.txt

CMD ["vsftpd", "/etc/vsftpd.conf"]