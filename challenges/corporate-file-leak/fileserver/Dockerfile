FROM ubuntu:22.04

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo net-tools samba && \
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

# Samba Service Setup
if [ -f /challenge/smb.conf ]; then
  cp /challenge/smb.conf /etc/samba/smb.conf
fi
/usr/sbin/smbd -D &
/usr/sbin/nmbd -D &
# SSH Service Setup
mkdir -p /var/run/sshd
/usr/sbin/sshd -D &

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 445
CMD ["/start-services.sh"]
