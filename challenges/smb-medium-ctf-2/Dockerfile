FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y samba samba-common-bin

RUN mkdir -p /srv/smb_public /srv/smb_ctf
RUN echo "Welcome to the SMB Medium Challenge" > /srv/smb_public/README.txt
RUN echo "Hint: The private share requires credentials." > /srv/smb_public/HINT.txt
RUN echo "SuperSecretFlag{Medium_Difficulty_SMB_CTF_New_V2}" > /srv/smb_ctf/flag.txt

COPY smb.conf /etc/samba/smb.conf

RUN useradd -M -s /sbin/nologin ctfuser && \
    (echo "letmein"; echo "letmein") | smbpasswd -s -a ctfuser

EXPOSE 445

CMD ["/usr/sbin/smbd", "-F", "--no-process-group"]