# Dockerfile for the victim server
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server apache2 && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    echo 'Welcome to the Acme server' > /var/www/html/index.html && \
    echo 'CTF{service_enumeration_master}' > /var/www/html/flag.txt

# Expose SSH and HTTP ports
EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D"]
