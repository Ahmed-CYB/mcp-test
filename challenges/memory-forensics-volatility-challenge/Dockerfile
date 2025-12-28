FROM python:3.11-slim
WORKDIR /challenge
RUN pip install --no-cache-dir --disable-pip-version-check volatility3
COPY memory.raw /challenge/
COPY flag.txt /challenge/
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]