FROM python:3.11-slim

RUN useradd -ms /bin/bash ctf
WORKDIR /app

RUN pip install flask==2.2.5

COPY app.py /app/app.py
COPY flag.txt /flag.txt

RUN chown -R root:root /app && chmod -R 755 /app && chmod 644 /flag.txt

USER ctf
EXPOSE 8080
CMD ["python", "app.py"]
