FROM python:3.11-slim
WORKDIR /challenge
RUN pip3 install --no-cache-dir volatility3
COPY memory.dump /challenge/
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]