FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y vsftpd && \
    useradd -m ftpuser && \
    echo 'ftpuser:ftpuser' | chpasswd && \
    mkdir -p /srv/ftp/public && \
    echo 'CTF{ftp_anonymous_login_exploit_2024}' > /srv/ftp/public/flag.txt && \
    chown -R ftpuser:ftpuser /srv/ftp && \
    chmod 755 /srv/ftp/public
COPY vsftpd.conf /etc/vsftpd.conf
EXPOSE 21
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]