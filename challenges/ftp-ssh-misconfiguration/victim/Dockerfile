# Base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server vsftpd && \
    mkdir /var/run/sshd

# Configure SSH
RUN echo 'root:toor' | chpasswd
COPY sshd_config /etc/ssh/sshd_config

# Configure FTP
COPY vsftpd.conf /etc/vsftpd.conf
RUN echo 'ftpuser:ftp123' | chpasswd

# Create a user directory and place the flag
RUN mkdir -p /home/ftpuser && \
    chmod a-w /home/ftpuser && \
    echo 'CTF{ftp_ssh_misconfig_flag}' > /home/ftpuser/flag.txt && \
    chmod 444 /home/ftpuser/flag.txt

EXPOSE 21 22

CMD service ssh start && vsftpd /etc/vsftpd.conf