FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*
COPY vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /home/ftp && \
    chown nobody:nogroup /home/ftp && \
    echo "FTPDemoBanner" > /etc/banner
EXPOSE 21
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
