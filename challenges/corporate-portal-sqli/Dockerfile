# Multi-stage build with comments
FROM python:3.11-slim AS base

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Set up application environment
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py ./
COPY templates/ ./templates/
COPY static/ ./static/

# Expose the necessary port
EXPOSE 8080

# Run the application
CMD ["python3", "app.py"]
