# Insecure Login Portal

## Learning Objectives
- Understand SQL Injection
- Explore authentication vulnerabilities
- Practice exploiting web application vulnerabilities

## Challenge Description
A fictional company's internal application login portal contains vulnerabilities. Your mission is to gain unauthorized access using SQL Injection.

Access the application at http://victim:8080 and try to log in without valid credentials.

## Deployment
Run the following command to start the challenge:
```sh
docker-compose up --build
```

## Hints
1. Try common SQL Injection payloads.
2. Consider how authentication queries can be bypassed.
3. String concatenation in SQL queries can lead to vulnerabilities.