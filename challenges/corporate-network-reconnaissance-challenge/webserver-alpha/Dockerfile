FROM alpine:latest

# Update and install services
RUN apk update && \
    apk add --no-cache \
    openssh sudo vim nano curl wget git net-tools iputils-ping apache2 openssh vsftpd \
    && rm -rf /var/cache/apk/*


# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config 2>/dev/null || \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config 2>/dev/null || \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

EXPOSE 22 21 80
CMD ["/usr/sbin/sshd", "-D"]
