FROM python:3.11-slim

RUN useradd -m ctf
WORKDIR /app

COPY app /app
RUN pip install --no-cache-dir -r requirements.txt || true

EXPOSE 8080
USER ctf
CMD ["python", "server.py"]
