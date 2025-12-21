FROM python:3.11-slim

# Set environment variables
ENV FLASK_APP=app.py

# Install dependencies
RUN pip install --no-cache-dir --disable-pip-version-check flask==3.0.0

# Copy application files
COPY app.py /app/app.py
COPY templates/ /app/templates/
COPY static/ /app/static/
COPY flag.txt /var/www/html/flag.txt

# Set working directory
WORKDIR /app

# Expose port
EXPOSE 8080

# Run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
