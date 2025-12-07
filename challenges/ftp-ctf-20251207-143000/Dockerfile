FROM debian:stable-slim

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
       vsftpd \
       python3 \
       python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Configure vsftpd with an anonymous-readable, writable directory and weak settings
RUN useradd -m ctf && echo 'ctf:ctfpassword' | chpasswd

RUN mkdir -p /var/ftp/pub && \
    echo 'flag{ftp_misconfig_leads_to_ownage}' > /var/ftp/pub/flag.txt && \
    chown -R nobody:nogroup /var/ftp && \
    chmod -R 777 /var/ftp

COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
