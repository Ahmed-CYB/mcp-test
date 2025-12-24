FROM ubuntu:22.04
RUN apt-get update && apt-get install -y vsftpd && rm -rf /var/lib/apt/lists/*
COPY vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /var/ftp && chmod 777 /var/ftp
COPY flag.txt /var/ftp/flag.txt
RUN chmod 644 /var/ftp/flag.txt
EXPOSE 21
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]