# Multi-stage build with comments
FROM python:3.11-slim AS base

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

# Copy app source code
COPY . .

# Expose port
EXPOSE 8080

# Run app
CMD [ "python", "./app.py" ]
