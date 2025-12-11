FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    vsftpd \
    python3 \
    python3-pip \
    inetutils-ping \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m ctfuser && echo 'ctfuser:ctfpassword' | chpasswd

RUN mkdir -p /var/ftp && chown -R ctfuser:ctfuser /var/ftp

COPY vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /entrypoint.sh
COPY flag.txt /var/ftp/flag.txt
RUN chmod +x /entrypoint.sh && chown ctfuser:ctfuser /var/ftp/flag.txt

EXPOSE 21

CMD ["/entrypoint.sh"]
