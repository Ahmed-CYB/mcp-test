FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y vsftpd python3 python3-pip netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Create ftp user and vulnerable app directory
RUN useradd -m ftpuser && echo 'ftpuser:ftp123' | chpasswd
RUN mkdir -p /var/ftp && chown ftpuser:ftpuser /var/ftp

# Simple vulnerable Python service to be exploited via FTP misconfig
RUN mkdir -p /opt/vulnapp
WORKDIR /opt/vulnapp

COPY vuln_service.py /opt/vulnapp/vuln_service.py
COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21 5000

CMD service vsftpd start && python3 /opt/vulnapp/vuln_service.py