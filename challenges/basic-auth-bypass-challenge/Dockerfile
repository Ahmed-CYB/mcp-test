# Dockerfile for Flask application with a basic authentication bypass vulnerability
FROM python:3.11-slim

# Set a working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]
