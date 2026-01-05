FROM vulhub/samba:4.6.3

# Install SSH for Guacamole compatibility
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd && \
    useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali && \
    echo 'kali ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create share directory and set permissions
RUN mkdir -p /home/share && \
    chmod 777 /home/share

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh
# CTF Flag
RUN mkdir -p /home/share && echo "CTF{samba_guest_access_anonymous_share}" > /home/share/flag.txt && chmod 644 /home/share/flag.txt

EXPOSE 22 445 6699

CMD ["/start.sh"]