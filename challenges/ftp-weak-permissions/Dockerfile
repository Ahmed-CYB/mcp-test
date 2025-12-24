FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    vsftpd && rm -rf /var/lib/apt/lists/*
COPY vsftpd.conf /etc/vsftpd.conf
COPY ftpusers /etc/ftpusers
COPY flag.txt /home/ftp/flag.txt
RUN chmod 644 /home/ftp/flag.txt && \
    chown nobody:nogroup /home/ftp/flag.txt
EXPOSE 21
CMD ["vsftpd", "/etc/vsftpd.conf"]