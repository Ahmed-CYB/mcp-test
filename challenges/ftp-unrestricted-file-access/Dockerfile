FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y vsftpd
COPY vsftpd.conf /etc/vsftpd.conf
COPY ftpusers /etc/ftpusers
COPY start.sh /usr/local/bin/start.sh
COPY flag.txt /srv/ftp/flag.txt
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 21
CMD ["/usr/local/bin/start.sh"]