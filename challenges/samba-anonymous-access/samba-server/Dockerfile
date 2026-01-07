FROM vulhub/samba:4.6.3

# Install SSH server for Guacamole compatibility
RUN apt-get update && apt-get install -y \
    openssh-server \
    vim \
    net-tools \
    smbclient \
    && rm -rf /var/lib/apt/lists/*

# Create kali user for SSH access
RUN useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali

# Configure SSH
RUN mkdir /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config

# Create shared directory and flag
RUN mkdir -p /home/share && \
    chmod 777 /home/share

# Copy configuration files
COPY smb.conf /usr/local/samba/etc/smb.conf
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# Expose ports
EXPOSE 22 445 6699

# Start services
CMD ["/setup.sh"]