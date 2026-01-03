FROM ubuntu:22.04

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo net-tools vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/bash kali 2>/dev/null || true && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

# Copy challenge files
COPY . /challenge/

# Create startup script
RUN cat > /start-services.sh << 'EOFSCRIPT'
#!/bin/bash
set -e

# FTP Service Setup
if [ -f /challenge/vsftpd.conf ]; then
  cp /challenge/vsftpd.conf /etc/vsftpd.conf
fi
mkdir -p /var/run/vsftpd/empty /var/ftp/data/classified
chmod 555 /var/ftp
chmod 755 /var/ftp/data /var/ftp/data/classified
if [ -f /challenge/flag.txt ]; then
  cp /challenge/flag.txt /var/ftp/data/classified/flag.txt
  chmod 644 /var/ftp/data/classified/flag.txt
  chown ftp:ftp /var/ftp/data/classified/flag.txt
fi
/usr/sbin/vsftpd /etc/vsftpd.conf &
# SSH Service Setup
mkdir -p /var/run/sshd
/usr/sbin/sshd -D &

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21
CMD ["/start-services.sh"]
