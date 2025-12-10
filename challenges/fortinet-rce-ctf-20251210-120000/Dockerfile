FROM python:3.11-slim

RUN apt-get update && apt-get install -y nginx fcgiwrap spawn-fcgi netcat-traditional && rm -rf /var/lib/apt/lists/*

RUN useradd -m fortiweb

RUN mkdir -p /opt/fortiweb/cgi-bin /opt/fortiweb/logs /run/fcgiwrap && \
    chown -R fortiweb:fortiweb /opt/fortiweb /run/fcgiwrap

COPY app/ /opt/fortiweb/

RUN chmod +x /opt/fortiweb/cgi-bin/vuln.cgi

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

USER root
ENTRYPOINT ["/entrypoint.sh"]
