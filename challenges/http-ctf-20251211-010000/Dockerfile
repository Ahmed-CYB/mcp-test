FROM python:3.11-slim

WORKDIR /app

RUN useradd -m ctf && \
    apt-get update && apt-get install -y --no-install-recommends \
        netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

COPY app /app

RUN chown -R ctf:ctf /app

USER ctf

EXPOSE 8080

CMD ["python", "server.py"]
