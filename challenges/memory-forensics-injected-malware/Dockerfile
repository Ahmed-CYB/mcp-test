FROM kalilinux/kali-rolling
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install --break-system-packages volatility3
COPY memory.dmp /root/challenge/
CMD ["/bin/bash"]