FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-pip openssh-server
RUN pip3 install --break-system-packages volatility3
RUN adduser --disabled-password --gecos '' memoryuser
RUN echo 'memoryuser:password' | chpasswd
COPY setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh
CMD ["/usr/local/bin/setup.sh"]