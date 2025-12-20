# FTP server setup
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
COPY init.sh /usr/local/bin/init.sh
COPY flag.txt /srv/ftp/flag.txt

RUN chmod +x /usr/local/bin/init.sh

CMD ["/usr/local/bin/init.sh"]