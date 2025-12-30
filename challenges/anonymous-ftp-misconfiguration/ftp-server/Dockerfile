FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    vsftpd \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Create FTP directories
RUN mkdir -p /var/ftp/pub/documents \
    && mkdir -p /var/ftp/uploads \
    && mkdir -p /var/run/vsftpd/empty

# Create FTP user
RUN useradd -d /var/ftp -s /bin/false ftp

# Copy configuration files
COPY vsftpd.conf /etc/vsftpd/
COPY sshd_config /etc/ssh/

# Create challenge files
RUN echo 'CTF{4n0nym0u5_ftp_m15c0nf1g_3xp053d}' > /var/ftp/pub/documents/flag.txt \
    && echo 'COMPANY SECURITY POLICY\n=======================\n\nAll FTP access should require authentication.\nAnonymous access is STRICTLY PROHIBITED.' > /var/ftp/pub/company_policy.txt \
    && echo 'Welcome to Company FTP Server' > /var/ftp/readme.txt

# Set permissions
RUN chown -R ftp:ftp /var/ftp \
    && chmod 755 /var/ftp \
    && chmod 755 /var/ftp/pub \
    && chmod 755 /var/ftp/pub/documents

# Expose ports
EXPOSE 21 22 40000-50000

# Start services
CMD service ssh start && vsftpd /etc/vsftpd/vsftpd.conf