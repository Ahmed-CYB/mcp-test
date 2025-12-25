FROM ubuntu:22.04
RUN apt-get update && apt-get install -y vsftpd
COPY vsftpd.conf /etc/vsftpd.conf
RUN useradd -m ftpuser && echo 'ftpuser:12345' | chpasswd
COPY flag.txt /var/www/html/flag.txt
RUN chmod 644 /var/www/html/flag.txt
EXPOSE 21
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]