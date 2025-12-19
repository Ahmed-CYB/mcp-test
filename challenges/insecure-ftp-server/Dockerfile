# Multi-stage build for secure and minimal setup
FROM alpine:3.17

RUN apk --no-cache add vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY flag.txt /var/ftp/flag.txt

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
