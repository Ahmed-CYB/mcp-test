FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y vsftpd && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /srv/ftp/public && echo 'CTF{ftp_anonymous_login_exploit_2024}' > /srv/ftp/public/flag.txt
COPY vsftpd.conf /etc/vsftpd.conf
EXPOSE 21
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]