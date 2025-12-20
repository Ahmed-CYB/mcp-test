# Multi-stage build for victim service
FROM python:3.11-slim AS build
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 8080
CMD ["python", "app.py"]