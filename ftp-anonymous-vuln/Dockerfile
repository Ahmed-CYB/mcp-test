FROM ubuntu:22.04

# Install vsftpd (Very Secure FTP Daemon)
RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

# Create a user for FTP access
RUN useradd -m -s /bin/bash ftpuser && \
    echo "ftpuser:password123" | chpasswd

# Create anonymous FTP directory
RUN mkdir -p /var/ftp/pub && \
    chown nobody:nogroup /var/ftp/pub && \
    chmod 755 /var/ftp/pub

# Create flag file
RUN echo "CTF{4n0nym0us_FTP_4cc3ss_Vuln3r4b1l1ty}" > /var/ftp/pub/flag.txt && \
    chown nobody:nogroup /var/ftp/pub/flag.txt && \
    chmod 644 /var/ftp/pub/flag.txt

# Create some dummy files to make it look more realistic
RUN echo "This is a sample file" > /var/ftp/pub/sample.txt && \
    echo "README: This FTP server contains important files" > /var/ftp/pub/README.md && \
    chown -R nobody:nogroup /var/ftp/pub/

# Copy vsftpd configuration
COPY vsftpd.conf /etc/vsftpd.conf

# Create startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose FTP ports
EXPOSE 20 21

# Start the FTP server
CMD ["/start.sh"]