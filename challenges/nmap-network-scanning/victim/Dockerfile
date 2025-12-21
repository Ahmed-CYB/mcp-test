FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y \
    apache2 \
    openssh-server \
 && rm -rf /var/lib/apt/lists/*

RUN echo 'CTF{nmap_success}' > /var/www/html/flag.txt

COPY index.html /var/www/html/index.html

EXPOSE 80 22
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]