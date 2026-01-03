FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update and install services
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-server sudo vim nano curl wget git net-tools iputils-ping ca-certificates unzip python3 python3-pip vsftpd  \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/bash kali 2>/dev/null || true && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

# ✅ IMPROVEMENT: Create dynamic startup script based on configured services
RUN     echo '#!/bin/bash' && \
    echo 'set -e' && \
    echo '' && \
    echo '# telnet service setup (AI-generated)' && \
    echo 'cp /challenge/telnetd.conf /etc/xinetd.d/telnet && cp /challenge/etc/issue.telnet /etc/issue.telnet && cp /challenge/etc/passwd /etc/passwd && cp /challenge/etc/shadow /etc/shadow && mkdir -p /home/legacy /home/maint /home/guest /var/log && cp /challenge/home/legacy/* /home/legacy/ && cp /challenge/var/log/system_backup.log /var/log/ && chown -R legacy:legacy /home/legacy && service xinetd start || /usr/sbin/xinetd -dontfork &' && \
    echo '' && \
    echo '# crypto service setup (AI-generated)' && \
    echo 'service vsftpd start && mkdir -p /var/ftp/hidden/.config /var/ftp/logs /var/ftp/upload /var/ftp/backup && chmod 755 /var/ftp/hidden && chmod 644 /var/ftp/hidden/.config/backup_config.txt' && \
    echo '' && \
    echo '# Keep container running' && \
    echo 'wait' && \
    echo '' > /start-services.sh && \
    chmod +x /start-services.sh

EXPOSE 21 23 25 53 1433
CMD ["/start-services.sh"]
