FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
    vsftpd \
    apache2 \
    samba \
    net-tools \
    inetutils-inetd \
    telnetd \
    xinetd \
    python3 \
    iproute2 \
    tcpdump \
    && rm -rf /var/lib/apt/lists/*

# SSH setup
RUN mkdir /var/run/sshd \
    && useradd -m ctfuser \
    && echo 'ctfuser:ctfpassword' | chpasswd

# FTP setup
RUN echo "listen=YES" >> /etc/vsftpd.conf \
    && echo "anonymous_enable=YES" >> /etc/vsftpd.conf \
    && echo "local_enable=YES" >> /etc/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd.conf

# Apache setup
RUN echo "<html><body><h1>Nmap Practice Web</h1></body></html>" > /var/www/html/index.html

# Samba setup
COPY smb.conf /etc/samba/smb.conf
RUN mkdir -p /srv/share && chmod 777 /srv/share

# Custom UDP service for version detection and NSE
RUN echo '#!/bin/sh\nwhile true; do echo "NMAP-UDP-SERVICE" | nc -u -l -p 9999; done' > /usr/local/bin/udp_service.sh \
    && chmod +x /usr/local/bin/udp_service.sh

# Xinetd-based bannered TCP service on 5555
RUN useradd banneruser || true
RUN echo 'service banner\n{\n    disable     = no\n    type        = UNLISTED\n    port        = 5555\n    socket_type = stream\n    protocol    = tcp\n    wait        = no\n    user        = root\n    server      = /bin/echo\n    server_args = "Custom Nmap Banner Service"\n}' > /etc/xinetd.d/banner

# Expose multiple ports to practice most Nmap techniques
EXPOSE 21/tcp 22/tcp 23/tcp 25/tcp 53/tcp 53/udp 80/tcp 110/tcp 139/tcp 143/tcp 445/tcp 8080/tcp 5555/tcp 9999/udp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
