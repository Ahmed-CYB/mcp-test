FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update and install services
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-server sudo vim nano curl wget git net-tools iputils-ping ca-certificates unzip python3 python3-pip vsftpd  \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/bash kali 2>/dev/null || true && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

# ✅ FIX: Copy challenge files into container (if they exist in build context)
# Note: Files are copied from the machine-specific directory (e.g., ftp-server/)
COPY . /challenge/

# ✅ FIX: Create dynamic startup script using heredoc (properly handles multi-line scripts)
RUN cat > /start-services.sh << 'EOFSCRIPT'
#!/bin/bash
set -e

# ftp service setup (AI-generated)
cp /challenge/vsftpd.conf /etc/vsftpd.conf & && cp /challenge/.banner /var/ftp/.banner && mkdir -p /var/run/vsftpd/empty & && mkdir -p /var/ftp/phoenix/secure && mkdir -p /var/ftp/phoenix/docs && mkdir -p /var/ftp/phoenix/logs && chmod 555 /var/ftp && chmod 755 /var/ftp/phoenix && chmod 755 /var/ftp/phoenix/secure && chmod 755 /var/ftp/phoenix/docs && chmod 755 /var/ftp/phoenix/logs && cp '/challenge/.message' '/var/ftp/phoenix/.message' && cp '/challenge/project_overview.txt' '/var/ftp/phoenix/project_overview.txt' && cp '/challenge/team_notes.txt' '/var/ftp/phoenix/secure/team_notes.txt' && cp '/challenge/encrypted_flag.txt' '/var/ftp/phoenix/secure/encrypted_flag.txt' && cp '/challenge/readme.txt' '/var/ftp/phoenix/readme.txt' && cp '/challenge/access.log' '/var/ftp/phoenix/logs/access.log' && chmod 644 /var/ftp/.banner && chmod 644 /var/ftp/phoenix/.message && chmod 644 /var/ftp/phoenix/project_overview.txt && chmod 644 /var/ftp/phoenix/secure/team_notes.txt && chmod 644 /var/ftp/phoenix/secure/encrypted_flag.txt && chmod 644 /var/ftp/phoenix/readme.txt && chmod 644 /var/ftp/phoenix/logs/access.log && chown -R ftp:ftp /var/ftp/phoenix && service vsftpd start || /usr/sbin/vsftpd /etc/vsftpd.conf &

# crypto service setup (AI-generated)
echo 'Project Phoenix crypto challenge files ready. Check /challenge directory for encrypted data and tools.'

# Keep container running
wait
EOFSCRIPT
RUN chmod +x /start-services.sh

EXPOSE 21 23 25 53 1433
CMD ["/start-services.sh"]
