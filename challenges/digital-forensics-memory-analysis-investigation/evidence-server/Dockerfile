FROM ubuntu:22.04

LABEL maintainer="CTF Platform"
LABEL description="Evidence repository containing memory dump and case files"

RUN apt-get update && apt-get install -y vsftpd && rm -rf /var/lib/apt/lists/*

WORKDIR /challenge
COPY . /challenge/

EXPOSE 21
EXPOSE 80

CMD ["bash", "-c", "tail -f /dev/null"]