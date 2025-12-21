# Set up an FTP server using vsftpd
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
COPY run.sh /run.sh
COPY flag.txt /srv/ftp/flag.txt

RUN chmod +x /run.sh

CMD ["/run.sh"]

EXPOSE 21
