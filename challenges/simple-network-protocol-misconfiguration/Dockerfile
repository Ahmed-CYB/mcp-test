FROM python:3.11-slim
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["python", "server.py"]