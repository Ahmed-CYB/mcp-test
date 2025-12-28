FROM python:3.11-slim
WORKDIR /challenge
RUN pip3 install --no-cache-dir volatility3
RUN echo 'Simulated memory dump with hidden flag CTF{memory_analysis_forensics_2024}' > memory.raw
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]