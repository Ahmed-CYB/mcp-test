# Multi-stage build with comments
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install python dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["python3", "app.py"]