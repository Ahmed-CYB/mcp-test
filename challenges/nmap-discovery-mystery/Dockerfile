# Dockerfile for the victim server
FROM debian:bookworm-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apache2 \
    openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN echo 'root:toor' | chpasswd
RUN mkdir /var/run/sshd
EXPOSE 80 22
CMD ["/usr/sbin/sshd", "-D"]