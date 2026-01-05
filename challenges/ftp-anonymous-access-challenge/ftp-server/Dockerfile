FROM vulhub/samba:4.6.3

# Install SSH server for Guacamole compatibility
RUN apt-get update && apt-get install -y openssh-server sudo vim net-tools

# Create kali user for SSH access
RUN useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali

# Configure SSH
RUN mkdir /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Create share directory
RUN mkdir -p /home/share

# Create flag file
RUN echo 'CTF{samba_anonymous_share_access_pwned}' > /home/share/flag.txt && \
    chmod 644 /home/share/flag.txt

# Create a decoy file with hint
RUN echo 'Welcome to the company file share! Important files are stored here.' > /home/share/readme.txt

# Ensure proper permissions for share
RUN chmod 755 /home/share && \
    chown -R nobody:nogroup /home/share

# Expose ports
EXPOSE 22 445 6699

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]