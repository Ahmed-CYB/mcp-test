FROM kalilinux/kali-rolling

# Use kali.download and drop other sources so unreachable regional redirects (e.g. mirror.aktkn.sg) are avoided
RUN rm -f /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources 2>/dev/null;     echo 'deb http://kali.download/kali kali-rolling main non-free non-free-firmware contrib' > /etc/apt/sources.list

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
    sqlmap \
    burpsuite \
    firefox-esr \
    gobuster \
    nikto \
    dirb \
    ffuf \
    wfuzz \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali && \
    # Allow kali to use sudo without a password so players can install/update tools freely
    echo 'kali ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/kali && \
    chmod 440 /etc/sudoers.d/kali && \
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

# 🔒 SECURITY: Install iptables and iproute2 for network isolation
RUN apt-get update && \
    apt-get install -y --no-install-recommends iptables iproute2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 🔒 SECURITY: Create network isolation script
# IMPORTANT: Allow Guacamole network (172.22.0.0/16) for SSH access - DO NOT BLOCK
# CRITICAL: Script must not fail container startup if network isolation fails
RUN echo '#!/bin/bash' > /usr/local/bin/secure-network.sh && \
    echo 'set +e' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Flush existing rules (ignore errors)' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -F OUTPUT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -F INPUT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -F FORWARD 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Set default policies (allow by default, then restrict)' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -P INPUT ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -P FORWARD ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -P OUTPUT ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Allow loopback' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A INPUT -i lo -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A OUTPUT -o lo -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Allow established and related connections' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Get gateway IP - try iproute2 first, fallback to hostname -I' >> /usr/local/bin/secure-network.sh && \
    echo 'GATEWAY=""' >> /usr/local/bin/secure-network.sh && \
    echo 'if command -v ip >/dev/null 2>&1; then' >> /usr/local/bin/secure-network.sh && \
    echo '  GATEWAY=$(ip route | grep default | awk '"'"'{print $3}'"'"' | head -1)' >> /usr/local/bin/secure-network.sh && \
    echo 'fi' >> /usr/local/bin/secure-network.sh && \
    echo 'if [ -z "$GATEWAY" ]; then' >> /usr/local/bin/secure-network.sh && \
    echo '  # Fallback: extract from interface IP (assume .1 is gateway)' >> /usr/local/bin/secure-network.sh && \
    echo '  MY_IP=$(hostname -I | awk '"'"'{print $1}'"'"')' >> /usr/local/bin/secure-network.sh && \
    echo '  if [ ! -z "$MY_IP" ]; then' >> /usr/local/bin/secure-network.sh && \
    echo '    GATEWAY=$(echo $MY_IP | cut -d. -f1-3).1' >> /usr/local/bin/secure-network.sh && \
    echo '  fi' >> /usr/local/bin/secure-network.sh && \
    echo 'fi' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Block gateway access (except DNS on port 53) - only if gateway is valid' >> /usr/local/bin/secure-network.sh && \
    echo 'if [ ! -z "$GATEWAY" ] && [ "$GATEWAY" != ".1" ]; then' >> /usr/local/bin/secure-network.sh && \
    echo '  echo "🔒 Blocking gateway access: $GATEWAY (except DNS)"' >> /usr/local/bin/secure-network.sh && \
    echo '  iptables -A OUTPUT -d $GATEWAY -p udp --dport 53 -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '  iptables -A OUTPUT -d $GATEWAY -j DROP 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'else' >> /usr/local/bin/secure-network.sh && \
    echo '  echo "⚠️  Could not determine gateway, skipping gateway blocking"' >> /usr/local/bin/secure-network.sh && \
    echo 'fi' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Block infrastructure networks (OUTPUT only - allow INPUT for SSH from Guacamole)' >> /usr/local/bin/secure-network.sh && \
    echo 'echo "🔒 Blocking infrastructure networks (OUTPUT only)"' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A OUTPUT -d 172.20.0.0/16 -j DROP 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A OUTPUT -d 172.21.0.0/16 -j DROP 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '# NOTE: 172.22.0.0/16 is Guacamole network - DO NOT BLOCK (needed for SSH access)' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Allow SSH from any source (for Guacamole access)' >> /usr/local/bin/secure-network.sh && \
    echo 'iptables -A INPUT -p tcp --dport 22 -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo '# Allow all traffic within challenge network' >> /usr/local/bin/secure-network.sh && \
    echo 'MY_IP=$(hostname -I | awk '"'"'{print $1}'"'"')' >> /usr/local/bin/secure-network.sh && \
    echo 'if [ ! -z "$MY_IP" ]; then' >> /usr/local/bin/secure-network.sh && \
    echo '  NETWORK=$(echo $MY_IP | cut -d. -f1-3).0/24' >> /usr/local/bin/secure-network.sh && \
    echo '  iptables -A OUTPUT -d $NETWORK -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo '  iptables -A INPUT -s $NETWORK -j ACCEPT 2>/dev/null || true' >> /usr/local/bin/secure-network.sh && \
    echo 'fi' >> /usr/local/bin/secure-network.sh && \
    echo '' >> /usr/local/bin/secure-network.sh && \
    echo 'echo "✅ Network isolation rules applied (Guacamole SSH access allowed)"' >> /usr/local/bin/secure-network.sh && \
    echo 'exit 0' >> /usr/local/bin/secure-network.sh && \
    chmod +x /usr/local/bin/secure-network.sh

# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

EXPOSE 22

# 🔒 SECURITY: Apply network isolation on container start
RUN echo '#!/bin/bash' > /start-secure.sh && \
    echo 'set +e' >> /start-secure.sh && \
    echo '' >> /start-secure.sh && \
    echo '# Apply network isolation rules (non-blocking)' >> /start-secure.sh && \
    echo '/usr/local/bin/secure-network.sh || echo "⚠️  Network isolation failed, continuing anyway..."' >> /start-secure.sh && \
    echo '' >> /start-secure.sh && \
    echo '# Start SSH daemon (this must succeed)' >> /start-secure.sh && \
    echo 'exec /usr/sbin/sshd -D' >> /start-secure.sh && \
    chmod +x /start-secure.sh

CMD ["/start-secure.sh"]
