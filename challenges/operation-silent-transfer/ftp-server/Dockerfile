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
    echo '# ftp service setup (AI-generated)' && \
    echo 'mkdir -p /var/ftp/data/classified /var/ftp/data/public /var/ftp/data/uploads /var/run/vsftpd/empty && cp /challenge/classified_intel.enc /var/ftp/data/classified/ && cp /challenge/readme.txt /var/ftp/data/ && cp /challenge/public_info.txt /var/ftp/data/public/ && cp /challenge/upload_instructions.txt /var/ftp/data/uploads/ && cp /challenge/vsftpd.conf /etc/vsftpd.conf && chown -R ftp:ftp /var/ftp && chmod -R 755 /var/ftp && chmod 777 /var/ftp/data/uploads && service vsftpd start || /usr/sbin/vsftpd &' && \
    echo '' && \
    echo '# crypto service setup (AI-generated)' && \
    echo 'service vsftpd start && echo '\''FTP server started with anonymous access to /challenge directory'\'' && chmod 644 /challenge/* && chown ftp:ftp /challenge/*' && \
    echo '' && \
    echo '# Keep container running' && \
    echo 'wait' && \
    echo '' > /start-services.sh && \
    chmod +x /start-services.sh

EXPOSE 21 25 53 1433 3306
CMD ["/start-services.sh"]
