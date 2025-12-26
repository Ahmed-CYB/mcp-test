FROM debian:bookworm-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    vsftpd \
    samba && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m ftpuser && \
    echo 'ftpuser:weakpassword' | chpasswd
COPY vsftpd.conf /etc/vsftpd.conf
COPY smb.conf /etc/samba/smb.conf
RUN mkdir -p /srv/ftp && \
    mkdir -p /srv/smb && \
    echo 'CTF{ftp_anonymous_login_exploit_2024}' > /srv/ftp/flag.txt && \
    echo 'CTF{smb_weak_password_exploit_2024}' > /srv/smb/flag.txt && \
    chmod 644 /srv/ftp/flag.txt && \
    chmod 644 /srv/smb/flag.txt
RUN (echo 'weakpassword'; echo 'weakpassword') | smbpasswd -a ftpuser -s
EXPOSE 21 139 445
CMD vsftpd & smbd -F -S