FROM ubuntu:22.04

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo net-tools apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH (root:toor + optional victim user with challenge-specific credentials)
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    RUN useradd -m -s /bin/sh runner 2>/dev/null || true && \
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
    echo '# HTTP Service Setup' >> /start-services.sh && \
    echo 'if [ -f /challenge/apache2.conf ]; then' >> /start-services.sh && \
    echo '  cp /challenge/apache2.conf /etc/apache2/apache2.conf' >> /start-services.sh && \
    echo 'fi' >> /start-services.sh && \
    echo 'mkdir -p /var/www/html' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/var/www/html"' >> /start-services.sh && \
    echo 'echo '\''CTF{LOfa_pXeAiPIVbeFbT3ecXU2Uq}'\'' > "/var/www/html/flag.txt"' >> /start-services.sh && \
    echo 'chmod 644 "/var/www/html/flag.txt"' >> /start-services.sh && \
    echo '/usr/sbin/apache2ctl -D FOREGROUND &' >> /start-services.sh && \
    echo '# SSH: place flag at default path (Vulhub-style)' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/root"' >> /start-services.sh && \
    echo 'echo '\''CTF{LOfa_pXeAiPIVbeFbT3ecXU2Uq}'\'' > "/root/flag.txt"' >> /start-services.sh && \
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

EXPOSE 80 22
# Run with /bin/sh so script works on all Linux images (Alpine, minimal, etc.)
CMD ["/bin/sh", "/start-services.sh"]
