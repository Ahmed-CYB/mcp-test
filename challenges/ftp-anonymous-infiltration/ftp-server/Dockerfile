FROM ubuntu:22.04

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo net-tools vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH (root:toor + optional victim user with challenge-specific credentials)
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/sh service 2>/dev/null || true && \
    echo 'service:getflag' | chpasswd && \
    usermod -aG sudo service 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create FTP user if FTP service is present (required for chown commands)
RUN useradd -r -s /bin/false -d /var/ftp ftp 2>/dev/null || true

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
    echo '# FTP Service Setup' >> /start-services.sh && \
    echo '# Create FTP user if it doesn'\''t exist (required for chown)' >> /start-services.sh && \
    echo 'useradd -r -s /bin/false -d /var/ftp ftp 2>/dev/null || true' >> /start-services.sh && \
    echo 'if [ -f /challenge/vsftpd.conf ]; then' >> /start-services.sh && \
    echo '  cp /challenge/vsftpd.conf /etc/vsftpd.conf' >> /start-services.sh && \
    echo 'fi' >> /start-services.sh && \
    echo 'mkdir -p /var/run/vsftpd/empty /var/ftp/data/classified' >> /start-services.sh && \
    echo 'chmod 555 /var/ftp' >> /start-services.sh && \
    echo 'chmod 755 /var/ftp/data /var/ftp/data/classified' >> /start-services.sh && \
    echo 'if [ -f /challenge/flag.txt ]; then' >> /start-services.sh && \
    echo '  cp /challenge/flag.txt /var/ftp/data/classified/flag.txt' >> /start-services.sh && \
    echo '  chmod 644 /var/ftp/data/classified/flag.txt' >> /start-services.sh && \
    echo '  chown ftp:ftp /var/ftp/data/classified/flag.txt 2>/dev/null || chown root:root /var/ftp/data/classified/flag.txt' >> /start-services.sh && \
    echo 'else' >> /start-services.sh && \
    echo '  echo '\''CTF{Au4HSihgeiOCFXI8y2DmK1TA}'\'' > /var/ftp/data/classified/flag.txt' >> /start-services.sh && \
    echo '  chmod 644 /var/ftp/data/classified/flag.txt' >> /start-services.sh && \
    echo '  chown ftp:ftp /var/ftp/data/classified/flag.txt 2>/dev/null || chown root:root /var/ftp/data/classified/flag.txt' >> /start-services.sh && \
    echo 'fi' >> /start-services.sh && \
    echo '/usr/sbin/vsftpd /etc/vsftpd.conf &' >> /start-services.sh && \
    echo '# SSH: place flag at default path (Vulhub-style)' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/root"' >> /start-services.sh && \
    echo 'echo '\''CTF{Au4HSihgeiOCFXI8y2DmK1TA}'\'' > "/root/flag.txt"' >> /start-services.sh && \
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

EXPOSE 21 22
# Run with /bin/sh so script works on all Linux images (Alpine, minimal, etc.)
CMD ["/bin/sh", "/start-services.sh"]
