# Base Image
FROM debian:latest

# Install SMB service
RUN apt-get update && apt-get install -y \
    samba \
    smbclient \
    && rm -rf /var/lib/apt/lists/*

# Copy smb.conf into container
COPY smb.conf /etc/samba/smb.conf

# Create a vulnerable share directory
RUN mkdir -p /smb ShareDir && \
    chmod -R 777 /smb

# Add a flag
RUN echo "flag{example_flag}" > /smb/flag.txt && \
    chmod 444 /smb/flag.txt

# Start SMB service
CMD ["smbd", "-FS"]