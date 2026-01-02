FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update and install services
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-server sudo vim nano curl wget git net-tools iputils-ping ca-certificates unzip python3 python3-pip samba nfs-common openssh-server snmp  \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Windows-like services (Samba for SMB/CIFS)
RUN apt-get update && apt-get install -y --no-install-recommends samba samba-common-bin && apt-get clean && rm -rf /var/lib/apt/lists/*


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

EXPOSE 22 445 139 135
CMD ["/usr/sbin/sshd", "-D"]
