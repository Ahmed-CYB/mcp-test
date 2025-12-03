# Dockerfile for SMB Vulnerability CTF

FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y samba && \
    mkdir -p /var/smb && \
    echo "flag{example_flag}" > /var/smb/flag.txt

COPY smb.conf /etc/samba/smb.conf

CMD ["smbd", "--foreground", "--no-process-group"]