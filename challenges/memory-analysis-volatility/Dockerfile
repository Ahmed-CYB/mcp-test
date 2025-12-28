FROM python:3.11-slim
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y --no-install-recommends \n    volatility \n && rm -rf /var/lib/apt/lists/*
COPY memory.dmp /usr/src/app/memory.dmp
COPY . .
CMD ["/bin/bash"]