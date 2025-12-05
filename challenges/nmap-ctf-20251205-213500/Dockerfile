FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server nginx vsftpd samba nmap net-tools iproute2 && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH
RUN mkdir /var/run/sshd && \
    useradd -m ctf && echo 'ctf:ctfpassword' | chpasswd

# Configure Nginx
RUN echo '<h1>Nmap Practice Web Service</h1>' > /var/www/html/index.html

# Configure vsftpd
RUN echo 'listen=NO' >> /etc/vsftpd.conf && \
    echo 'listen_ipv6=YES' >> /etc/vsftpd.conf && \
    echo 'anonymous_enable=YES' >> /etc/vsftpd.conf && \
    echo 'anon_root=/var/ftp' >> /etc/vsftpd.conf && \
    mkdir -p /var/ftp && echo 'Welcome to FTP service' > /var/ftp/readme.txt

# Simple SMB share
RUN mkdir -p /srv/share && echo 'Demo SMB share for Nmap' > /srv/share/info.txt
COPY smb.conf /etc/samba/smb.conf
RUN useradd smbuser && echo 'smbuser:smbpass' | chpasswd && smbpasswd -a -s smbuser <<EOF
smbpass
smbpass
EOF

# Expose multiple ports for scanning
EXPOSE 22 80 21 139 445 8080 9999

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
