# Dockerfile for the SMB CTF Challenge - Hard Difficulty
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    samba \
    smbclient \
    && rm -rf /var/lib/apt/lists/*

COPY smb.conf /etc/samba/

CMD ["smbd", "-F"]
