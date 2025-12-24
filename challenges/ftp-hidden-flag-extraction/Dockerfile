FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y vsftpd
COPY vsftpd.conf /etc/vsftpd.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY flag.txt /srv/ftp/flag.txt
RUN chmod 644 /srv/ftp/flag.txt
EXPOSE 21
CMD ["/start.sh"]