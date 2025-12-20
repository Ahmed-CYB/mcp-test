# FTP server setup using vsftpd
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /home/ftp/ && \
    chmod 755 /home/ftp

COPY flag.txt /home/ftp/hidden/.flag.txt
RUN chmod 700 /home/ftp/hidden && \
    chmod 600 /home/ftp/hidden/.flag.txt

EXPOSE 21 30000-30009

CMD ["vsftpd", "/etc/vsftpd.conf"]
