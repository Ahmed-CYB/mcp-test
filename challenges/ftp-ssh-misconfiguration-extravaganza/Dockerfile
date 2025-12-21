# Set up a Debian-based container with FTP and SSH
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    vsftpd \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Configure vsftpd
COPY vsftpd.conf /etc/vsftpd.conf

# Configure SSH
RUN mkdir /var/run/sshd
COPY sshd_config /etc/ssh/sshd_config

# Add a user with a weak password
RUN useradd -m -s /bin/bash ftpuser && echo "ftpuser:password123" | chpasswd

# Place the flag in the FTP directory with accessible permissions
RUN mkdir -p /srv/ftp && echo "CTF{ssh_and_ftp_insecure_configuration}" > /srv/ftp/flag.txt && chmod 644 /srv/ftp/flag.txt

EXPOSE 21 22
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"] & /usr/sbin/sshd -D
