FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*

RUN useradd -m weakuser && echo 'weakuser:password123' | chpasswd

RUN mkdir /var/run/sshd

COPY flag.txt /root/flag.txt

RUN chmod 600 /root/flag.txt

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]