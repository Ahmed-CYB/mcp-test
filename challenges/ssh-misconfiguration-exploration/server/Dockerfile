FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y openssh-server && \
    echo 'root:weakpassword' | chpasswd
COPY sshd_config /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
