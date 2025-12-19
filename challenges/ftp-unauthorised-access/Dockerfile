# Setup a vulnerable FTP server
FROM stilliard/pure-ftpd:latest
RUN (echo password; echo password) | adduser user
EXPOSE 21 30000-30009
CMD /run.sh -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30009 -c 50 -C 10