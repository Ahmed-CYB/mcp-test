FROM vulhub/samba:4.6.3

# Install SSH server for Guacamole compatibility
RUN apt-get update && apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd && \
    useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali && \
    echo 'kali ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create share directory and set permissions
RUN mkdir -p /home/share && \
    chmod 777 /home/share

# Create flag file in the share
RUN echo 'CTF{samba_guest_access_pwned}' > /home/share/flag.txt && \
    chmod 644 /home/share/flag.txt

# Create startup script
RUN echo '#!/bin/bash\n\
/usr/sbin/sshd -D &\n\
/usr/local/samba/sbin/smbd -D --configfile=/usr/local/samba/etc/smb.conf\n\
/usr/local/samba/sbin/nmbd -D --configfile=/usr/local/samba/etc/smb.conf\n\
tail -f /dev/null' > /start.sh && \
    chmod +x /start.sh

EXPOSE 22 445 6699

CMD ["/start.sh"]