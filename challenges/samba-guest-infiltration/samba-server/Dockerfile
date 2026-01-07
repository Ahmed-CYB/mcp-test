FROM vulhub/samba:4.6.3

# Install SSH server for Guacamole compatibility
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create kali user for SSH access
RUN useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali

# Configure SSH
RUN mkdir /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create share directory and flag
RUN mkdir -p /home/share && \
    chmod 777 /home/share

# Create startup script
RUN echo '#!/bin/bash\n\
# Start SSH service\n\
service ssh start\n\
# Place the flag\n\
echo "CTF{samba_guest_access_anonymous_share}" > /home/share/flag.txt\n\
chmod 644 /home/share/flag.txt\n\
# Start Samba in foreground\n\
exec /usr/local/samba/sbin/smbd -F -S' > /start.sh && \
    chmod +x /start.sh

EXPOSE 22 445 6699

CMD ["/start.sh"]