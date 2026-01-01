FROM centos:7

ENV DEBIAN_FRONTEND=noninteractive

# Update and install services
RUN dnf install -y --setopt=install_weak_deps=False \
    openssh-server sudo vim nano curl wget git net-tools iputils mariadb-server openssh-server httpd  \
    && dnf clean all


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

EXPOSE 22 80
CMD ["/usr/sbin/sshd", "-D"]
