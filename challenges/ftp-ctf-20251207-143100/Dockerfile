FROM debian:12-slim

RUN apt-get update && \
    apt-get install -y vsftpd python3 python3-pip netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m ftpuser && echo "ftpuser:P@ssw0rd!" | chpasswd

COPY vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/ftp/pub && \
    echo "flag{redacted_flag}" > /var/ftp/pub/.flag.txt && \
    chown -R ftpuser:ftpuser /var/ftp && \
    chmod -R 755 /var/ftp

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
