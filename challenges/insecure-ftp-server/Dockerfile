# Set up vsftpd server
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    vsftpd && rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
