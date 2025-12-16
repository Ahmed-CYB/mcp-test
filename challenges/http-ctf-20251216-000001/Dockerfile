FROM python:3.11-slim

WORKDIR /app

RUN useradd -m ctfuser

COPY app /app

RUN pip install --no-cache-dir -r requirements.txt || true

USER ctfuser

EXPOSE 8080

CMD ["python", "server.py"]
