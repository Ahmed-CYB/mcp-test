FROM python:3.11-slim
WORKDIR /challenge
RUN pip install --no-cache-dir volatility3
COPY memory.raw /challenge/memory.raw
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]