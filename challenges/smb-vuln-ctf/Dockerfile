# Setting up layered architectures of SMB through history
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y samba

# Copy SMB configurations
COPY smb.conf /etc/samba/smb.conf

# Create various directories and permissions
RUN mkdir -p /srv/smb/ancient_logs /srv/smb/forgotten_ciphers /srv/smb/engineers_notes \
    && echo "Welcome to the depths of history..." > /srv/smb/ancient_logs/readme.txt \
    && echo "The code is hidden within" > /srv/smb/forgotten_ciphers/hint.txt \
    && echo "Seek the engineers' wisdom" > /srv/smb/engineers_notes/note.txt

CMD ["smbd", "-FS"]