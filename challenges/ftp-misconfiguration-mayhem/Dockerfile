# Base Image
FROM stilliard/pure-ftpd
# Set up FTP server
RUN (echo CTF{ftp_config_gone_wrong}; echo CTF{ftp_config_gone_wrong}) | pure-pw useradd challenge -f /etc/pure-ftpd/passwd/pureftpd.passwd -u ftpuser -d /home/ftpusers/challenge
RUN pure-pw mkdb
CMD ["/run.sh", "-c", "/etc/pure-ftpd" ]