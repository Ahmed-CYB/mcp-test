FROM vulhub/samba:4.6.3

# Install SSH server for Guacamole compatibility
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    echo 'kali ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

# Create shared directory and place flag
RUN mkdir -p /home/share && \
    echo 'CTF{samba_guest_access_pwned}' > /home/share/flag.txt && \
    chmod 644 /home/share/flag.txt && \
    chown nobody:nobody /home/share/flag.txt

# Create startup script
RUN echo '#!/bin/bash' > /start.sh && \
    echo '/usr/sbin/sshd -D &' >> /start.sh && \
    echo '/usr/local/samba/sbin/smbd -D' >> /start.sh && \
    echo '/usr/local/samba/sbin/nmbd -D' >> /start.sh && \
    echo 'tail -f /dev/null' >> /start.sh && \
    chmod +x /start.sh

EXPOSE 22 445 6699

CMD ["/start.sh"]