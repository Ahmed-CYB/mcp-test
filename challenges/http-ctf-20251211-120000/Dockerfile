FROM python:3.11-slim

RUN useradd -m ctf
WORKDIR /app

RUN pip install --no-cache-dir flask==2.3.3

COPY app /app

RUN chown -R ctf:ctf /app
USER ctf

EXPOSE 8080

CMD ["python", "server.py"]
