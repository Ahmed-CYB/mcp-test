# SQL Injection Login Bypass

## Learning Objectives
- Understand SQL Injection vulnerabilities
- Learn how to exploit input fields to bypass authentication
- Practice using SQL Injection techniques

## Challenge Setup
This challenge consists of a vulnerable Flask web application running in a Docker container. Your goal is to exploit the SQL Injection vulnerability present in the login form to bypass authentication and access the dashboard.

## How to Solve
Access the login page and test for SQL Injection vulnerabilities. By entering specific payloads in the username and/or password fields, you can trick the application into logging you in without proper credentials.

## Deployment Instructions
Use the provided `docker-compose.yml` to set up the challenge environment. Run `docker-compose up` to start the victim and attacker containers. Access the attacker container through a web browser and connect to the victim application at http://victim:8080.

## Hint
Start by testing the login form with inputs that contain special SQL syntax.