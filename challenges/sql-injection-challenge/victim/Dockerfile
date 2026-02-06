FROM php:8.2-apache

# Update and install packages
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
    apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo net-tools mariadb-server php-mysql && \
    apt-get clean

# Configure SSH (root:toor + optional victim user with challenge-specific credentials)
RUN mkdir -p /var/run/sshd && \
    echo 'root:toor' | chpasswd && \
    useradd -m -s /bin/sh victim 2>/dev/null || true && \
    echo 'victim:admin' | chpasswd && \
    usermod -aG sudo victim 2>/dev/null || true && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config


# Create challenge directory
RUN mkdir -p /challenge && chmod 755 /challenge

# Copy challenge files
COPY . /challenge/

# Create startup script using echo (most reliable method, avoids heredoc issues)
# Use #!/bin/sh for Alpine/minimal images that may not have /bin/bash
RUN echo '#!/bin/sh' > /start-services.sh && \
    echo '#!/bin/sh' >> /start-services.sh && \
    echo 'set -e' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    echo '# SQL injection template: MySQL + vulnerable PHP' >> /start-services.sh && \
    echo 'service mariadb start || true' >> /start-services.sh && \
    echo 'sleep 2' >> /start-services.sh && \
    echo 'mysql -e "CREATE DATABASE IF NOT EXISTS ctf; USE ctf; CREATE TABLE IF NOT EXISTS users(id int,user varchar(100),pass varchar(100)); CREATE TABLE IF NOT EXISTS secrets(flag varchar(255)); INSERT INTO users VALUES(1,'\''admin'\'','\''admin'\''); INSERT INTO secrets VALUES("CTF{6ulpP8AxDF0JYb39Ebjqv}");" 2>/dev/null || true' >> /start-services.sh && \
    echo 'mkdir -p /var/www/html' >> /start-services.sh && \
    echo 'cat > /var/www/html/index.php << '\''ENDPHP'\''' >> /start-services.sh && \
    echo '<?php' >> /start-services.sh && \
    echo '$c=new mysqli("localhost","root","","ctf");' >> /start-services.sh && \
    echo 'if(!$c->connect_error){' >> /start-services.sh && \
    echo '$u=isset($_GET["user"])?$_GET["user"]:"";' >> /start-services.sh && \
    echo '$r=$c->query("SELECT * FROM users WHERE user='\''".$u."'\''");' >> /start-services.sh && \
    echo 'if($r){ while($row=$r->fetch_assoc()){ echo implode(" ",$row); } }' >> /start-services.sh && \
    echo '}' >> /start-services.sh && \
    echo '?>' >> /start-services.sh && \
    echo 'ENDPHP' >> /start-services.sh && \
    echo 'chmod 644 /var/www/html/index.php' >> /start-services.sh && \
    echo '/usr/sbin/apache2ctl -D FOREGROUND &' >> /start-services.sh && \
    echo '# SSH: place flag at default path (Vulhub-style)' >> /start-services.sh && \
    echo '# Place flag (Vulhub-style location)' >> /start-services.sh && \
    echo 'mkdir -p "/root"' >> /start-services.sh && \
    echo 'echo '\''CTF{6ulpP8AxDF0JYb39Ebjqv}'\'' > "/root/flag.txt"' >> /start-services.sh && \
    echo 'chmod 644 "/root/flag.txt"' >> /start-services.sh && \
    echo '# SSH Service Setup' >> /start-services.sh && \
    echo 'mkdir -p /var/run/sshd' >> /start-services.sh && \
    echo '# Generate host keys if missing (Alpine/minimal images often have no host keys)' >> /start-services.sh && \
    echo 'if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then' >> /start-services.sh && \
    echo '  ssh-keygen -A 2>/dev/null || true' >> /start-services.sh && \
    echo 'fi' >> /start-services.sh && \
    echo '/usr/sbin/sshd -D &' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    echo '# Keep container running' >> /start-services.sh && \
    echo 'wait' >> /start-services.sh && \
    echo '' >> /start-services.sh && \
    chmod +x /start-services.sh && \
    test -f /start-services.sh || (echo "ERROR: Failed to create /start-services.sh" && exit 1)

EXPOSE 80 22
# Run with /bin/sh so script works on all Linux images (Alpine, minimal, etc.)
CMD ["/bin/sh", "/start-services.sh"]
