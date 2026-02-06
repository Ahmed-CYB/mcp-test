FROM ubuntu:22.04

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo net-tools samba && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH (root:toor + optional victim user with challenge-specific credentials)
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/sh runner 2>/dev/null || true && \
    echo 'runner:ctf2024' | chpasswd && \
    usermod -aG sudo runner 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config


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
    echo 'echo '\''CTF{kWztf2_64mZ-mwUK5a}'\'' > /tmp/share/flag.txt' >> /start-services.sh && \
    echo 'chmod 644 /tmp/share/flag.txt' >> /start-services.sh && \
    echo '/usr/sbin/smbd -D &' >> /start-services.sh && \
    echo '/usr/sbin/nmbd -D &' >> /start-services.sh && \
    echo '# SSH: place flag at default path (Vulhub-style)' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/root"' >> /start-services.sh && \
    echo 'echo '\''CTF{kWztf2_64mZ-mwUK5a}'\'' > "/root/flag.txt"' >> /start-services.sh && \
    echo 'chmod 644 "/root/flag.txt"' >> /start-services.sh && \
    echo '# SSH Service Setup' >> /start-services.sh && \
    echo 'mkdir -p /var/run/sshd' >> /start-services.sh && \
    echo '# Generate host keys if missing (Alpine/minimal images often have no host keys)' >> /start-services.sh && \
    echo 'if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then' >> /start-services.sh && \
    echo '  ssh-keygen -A 2>/dev/null || true' >> /start-services.sh && \
    echo 'fi' >> /start-services.sh && \
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
