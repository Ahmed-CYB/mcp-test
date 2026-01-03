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
cp /challenge/vsftpd.conf /etc/vsftpd.conf & && mkdir -p /var/run/vsftpd/empty & && mkdir -p /var/ftp/staging/{backup,config,logs,tools} && chmod 555 /var/ftp && chmod 755 /var/ftp/staging && chmod 755 /var/ftp/staging/backup && chmod 755 /var/ftp/staging/config && chmod 755 /var/ftp/staging/logs && chmod 755 /var/ftp/staging/tools && cp /challenge/flag.txt.enc /var/ftp/staging/backup/ && cp /challenge/readme.txt /var/ftp/staging/ && cp /challenge/system_config.txt /var/ftp/staging/config/ && cp /challenge/access.log /var/ftp/staging/logs/ && cp /challenge/decrypt.py /var/ftp/staging/tools/ && chmod 644 /var/ftp/staging/backup/flag.txt.enc && chmod 644 /var/ftp/staging/readme.txt && chmod 644 /var/ftp/staging/config/system_config.txt && chmod 644 /var/ftp/staging/logs/access.log && chmod 755 /var/ftp/staging/tools/decrypt.py && chown -R ftp:ftp /var/ftp/staging && service vsftpd start || /usr/sbin/vsftpd &

# crypto service setup (AI-generated)
service vsftpd start & && useradd -m -s /bin/bash admin && echo 'admin:backup123' | chpasswd && useradd -m -s /bin/bash backup && echo 'backup:system456' | chpasswd && mkdir -p /home/ftp/{confidential,system,data,logs} && chown -R admin:admin /home/ftp && chmod 755 /home/ftp && chmod -R 644 /home/ftp/*

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21 25 28 53 1433
CMD ["/start-services.sh"]
