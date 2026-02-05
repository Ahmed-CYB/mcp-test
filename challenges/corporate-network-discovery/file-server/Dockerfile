FROM alpine:3.18

# Update and install packages
RUN apk add --no-cache openssh sudo net-tools samba

# Configure SSH (root:toor + optional victim user with challenge-specific credentials)
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    RUN useradd -m -s /bin/sh player 2>/dev/null || true && \
    echo 'player:playground' | chpasswd && \
    usermod -aG sudo player 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config 2>/dev/null || \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config 2>/dev/null || \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config


# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

# Copy challenge files
COPY . /challenge/

# Create startup script using echo (most reliable method, avoids heredoc issues)
# Use #!/bin/sh for Alpine/minimal images that may not have /bin/bash
RUN echo '#!/bin/sh' > /start-services.sh && \
    echo '#!/bin/sh' >> /start-services.sh && \
    echo 'set -e' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    echo '# Samba Service Setup' >> /start-services.sh && \
    echo 'mkdir -p /var/lib/samba/private /var/run/samba' >> /start-services.sh && \
    echo 'if [ -f /challenge/smb.conf ]; then' >> /start-services.sh && \
    echo '  cp /challenge/smb.conf /etc/samba/smb.conf' >> /start-services.sh && \
    echo 'else' >> /start-services.sh && \
    echo '  # Create basic Samba config if not provided' >> /start-services.sh && \
    echo '  mkdir -p /etc/samba' >> /start-services.sh && \
    echo '  cat > /etc/samba/smb.conf << '\''EOF'\''' >> /start-services.sh && \
    echo '[global]' >> /start-services.sh && \
    echo 'workgroup = WORKGROUP' >> /start-services.sh && \
    echo 'server string = Samba Server' >> /start-services.sh && \
    echo 'security = user' >> /start-services.sh && \
    echo 'map to guest = Bad User' >> /start-services.sh && \
    echo 'guest ok = yes' >> /start-services.sh && \
    echo 'guest account = nobody' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    echo '[share]' >> /start-services.sh && \
    echo 'path = /tmp/share' >> /start-services.sh && \
    echo 'browseable = yes' >> /start-services.sh && \
    echo 'writable = yes' >> /start-services.sh && \
    echo 'guest ok = yes' >> /start-services.sh && \
    echo 'EOF' >> /start-services.sh && \
    echo 'fi' >> /start-services.sh && \
    echo 'mkdir -p /tmp/share' >> /start-services.sh && \
    echo 'chmod 777 /tmp/share' >> /start-services.sh && \
    echo '# Place flag in share (Vulhub-style path)' >> /start-services.sh && \
    echo 'echo '\''CTF{820s_djhFJn82f_WzF}'\'' > /tmp/share/flag.txt' >> /start-services.sh && \
    echo 'chmod 644 /tmp/share/flag.txt' >> /start-services.sh && \
    echo '/usr/sbin/smbd -D &' >> /start-services.sh && \
    echo '/usr/sbin/nmbd -D &' >> /start-services.sh && \
    echo '# SSH: place flag at default path (Vulhub-style)' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/root"' >> /start-services.sh && \
    echo 'echo '\''CTF{820s_djhFJn82f_WzF}'\'' > "/root/flag.txt"' >> /start-services.sh && \
    echo 'chmod 644 "/root/flag.txt"' >> /start-services.sh && \
    echo '# SSH Service Setup' >> /start-services.sh && \
    echo 'mkdir -p /var/run/sshd' >> /start-services.sh && \
    echo '/usr/sbin/sshd -D &' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    echo '# Keep container running' >> /start-services.sh && \
    echo 'wait' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    chmod +x /start-services.sh && \
    test -f /start-services.sh || (echo "ERROR: Failed to create /start-services.sh" && exit 1)

EXPOSE 445 22
# Run with /bin/sh so script works on all Linux images (Alpine, minimal, etc.)
CMD ["/bin/sh", "/start-services.sh"]
