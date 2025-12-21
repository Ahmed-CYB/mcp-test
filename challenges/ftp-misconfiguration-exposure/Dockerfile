# Build an FTP server using vsftpd
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf

RUN useradd -m ftpuser && echo 'ftpuser:ftpuser' | chpasswd

COPY flag.txt /srv/ftp/flag.txt
RUN chmod 755 /srv/ftp/flag.txt

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]
