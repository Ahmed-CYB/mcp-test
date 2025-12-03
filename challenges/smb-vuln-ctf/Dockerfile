# Dockerfile for SMB Vulnerability CTF Challenge

FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y samba && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY smb.conf /etc/samba/smb.conf

RUN mkdir -p /srv/samba/share && \
    echo "The flag can be found within the shadows of forgotten logs." > /srv/samba/share/flag.txt

EXPOSE 139 445

CMD ["/usr/sbin/smbd", "--foreground", "--log-stdout"]