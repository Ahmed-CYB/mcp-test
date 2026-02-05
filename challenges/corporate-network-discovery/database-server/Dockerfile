FROM rockylinux:9

# Update and install packages
RUN dnf install -y --setopt=install_weak_deps=False openssh-server sudo net-tools mariadb-server && \
    dnf clean all

# Configure SSH (root:toor + optional victim user with challenge-specific credentials)
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    RUN useradd -m -s /bin/sh admin 2>/dev/null || true && \
    echo 'admin:redteam' | chpasswd && \
    usermod -aG sudo admin 2>/dev/null || true && \
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
    echo '# SSH: place flag at default path (Vulhub-style)' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/root"' >> /start-services.sh && \
    echo 'echo '\''CTF{5h0xOCiSb9mTRheFzZIEOsD}'\'' > "/root/flag.txt"' >> /start-services.sh && \
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

EXPOSE 3306 22
# Run with /bin/sh so script works on all Linux images (Alpine, minimal, etc.)
CMD ["/bin/sh", "/start-services.sh"]
