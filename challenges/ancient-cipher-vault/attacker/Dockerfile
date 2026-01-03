FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# CRITICAL: Always update package lists before installing
# Update and install base tools + SSH
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openssh-server \
    sudo \
    vim \
    nano \
    curl \
    wget \
    git \
    net-tools \
    iputils-ping \
    ca-certificates \
    unzip \
    python3 \
    python3-pip \
    coreutils \
    hashcat \
    john \
    openssl \
    hashid \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# ✅ FIX: Replace nmap wrapper to always use unprivileged mode
# The default /usr/bin/nmap wrapper tries to use --privileged which requires capabilities
# We replace it with a wrapper that always uses --unprivileged mode
RUN mv /usr/bin/nmap /usr/bin/nmap.original 2>/dev/null || true && \
    echo '#!/bin/bash' > /usr/bin/nmap && \
    echo '# Nmap wrapper - always use unprivileged mode (no CAP_NET_RAW required)' >> /usr/bin/nmap && \
    echo 'exec /usr/lib/nmap/nmap --unprivileged "$@"' >> /usr/bin/nmap && \
    chmod +x /usr/bin/nmap

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
