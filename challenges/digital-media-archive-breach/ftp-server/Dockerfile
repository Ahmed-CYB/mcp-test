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

# ✅ FIX: Copy challenge files into container (if they exist in build context)
# Note: Files are copied from the machine-specific directory (e.g., ftp-server/)
COPY . /challenge/

# ✅ FIX: Create dynamic startup script using heredoc (properly handles multi-line scripts)
RUN cat > /start-services.sh << 'EOFSCRIPT'
#!/bin/bash
set -e

# ftp service setup (AI-generated)
cp /challenge/vsftpd.conf /etc/vsftpd.conf & && mkdir -p /var/run/vsftpd/empty & && mkdir -p /var/ftp/archive/projects && mkdir -p /var/ftp/archive/public && mkdir -p /var/ftp/config/anonymous && chmod 555 /var/ftp && chmod 755 /var/ftp/archive && chmod 755 /var/ftp/archive/projects && chmod 755 /var/ftp/archive/public && chmod 755 /var/ftp/config && chmod 755 /var/ftp/config/anonymous && cp /challenge/encrypted_projects.txt /var/ftp/archive/projects/encrypted_projects.txt && cp /challenge/cipher_config.txt /var/ftp/config/anonymous/cipher_config.txt && cp /challenge/readme.txt /var/ftp/archive/readme.txt && cp /challenge/media_samples.txt /var/ftp/archive/public/media_samples.txt && chmod 644 /var/ftp/archive/projects/encrypted_projects.txt && chmod 644 /var/ftp/config/anonymous/cipher_config.txt && chmod 644 /var/ftp/archive/readme.txt && chmod 644 /var/ftp/archive/public/media_samples.txt && chown -R ftp:ftp /var/ftp/archive && chown -R ftp:ftp /var/ftp/config && service vsftpd start || /usr/sbin/vsftpd /etc/vsftpd.conf &

# crypto service setup (AI-generated)
service vsftpd start & && mkdir -p /ftp/public /ftp/config /ftp/logs && chmod 755 /ftp/public /ftp/config /ftp/logs

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21 22 25 53 1433
CMD ["/start-services.sh"]
