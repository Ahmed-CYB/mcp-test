# Use a slim Python image for the web application
FROM python:3.11-slim

# Set up a work directory
WORKDIR /app

# Copy the application code
COPY app.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

# Expose port 8080
EXPOSE 8080

# Run the web server
CMD ["python", "app.py"]