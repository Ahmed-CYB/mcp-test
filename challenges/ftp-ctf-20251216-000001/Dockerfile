FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y vsftpd python3 python3-pip net-tools && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m ctfuser && echo 'ctfuser:ctfpassword' | chpasswd

COPY vsftpd.conf /etc/vsftpd.conf
COPY start_vsftpd.sh /start_vsftpd.sh
RUN chmod +x /start_vsftpd.sh

EXPOSE 21 21000-21010

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD nc -z localhost 21 || exit 1

CMD ["/start_vsftpd.sh"]
