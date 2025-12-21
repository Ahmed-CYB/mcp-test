# Dockerfile for the victim service
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends vsftpd openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Configure FTP
COPY vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /srv/ftp && chown -R ftp:ftp /srv/ftp

# Configure SSH with weak credentials
RUN echo 'user:weakpassword123' | chpasswd
RUN mkdir -p /var/run/sshd

EXPOSE 21 22

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
