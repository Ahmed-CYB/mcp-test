FROM debian:12-slim

RUN apt-get update && \
    apt-get install -y vsftpd python3 python3-pip netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m ctf && echo "ctf:ctfpass" | chpasswd

RUN mkdir -p /var/run/vsftpd/ /var/log/vsftpd/ /var/ftp && \
    chown -R ftp:ftp /var/ftp || true

COPY vsftpd.conf /etc/vsftpd.conf
COPY flag.txt /home/ctf/flag.txt
RUN chown ctf:ctf /home/ctf/flag.txt && chmod 600 /home/ctf/flag.txt

COPY vuln_server.py /opt/vuln_server.py

EXPOSE 21

CMD service vsftpd restart && python3 /opt/vuln_server.py
