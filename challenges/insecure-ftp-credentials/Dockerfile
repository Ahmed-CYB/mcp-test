FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y vsftpd && rm -rf /var/lib/apt/lists/*
COPY vsftpd.conf /etc/vsftpd.conf
COPY flag.txt /srv/ftp/flag.txt
RUN useradd -m ftpuser && echo "ftpuser:password123" | chpasswd
EXPOSE 21
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]