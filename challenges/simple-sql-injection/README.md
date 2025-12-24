# Simple SQL Injection Challenge

## Learning Objectives
- Understand the basics of SQL Injection
- Exploit SQL Injection vulnerabilities to bypass authentication

## Scenario
You are given access to a vulnerable e-commerce website's login page. Your task is to bypass the login mechanism and access the admin's dashboard using SQL Injection.

## Attack Instructions
- Use Kali Linux (attacker container) to perform attacks.
- Access the victim service at http://victim:8080.
- Identify and exploit the SQL injection vulnerability to bypass the login form.

## Hints
1. Look at the login form and consider how inputs might be incorporated into SQL queries.
2. Think about how you can inject SQL that changes the logic of the query.
3. Consider how to comment out parts of SQL queries to manipulate execution.

## Deployment
Run `docker-compose up` to start the challenge environment. Access the attacker container through VNC and start attacking!