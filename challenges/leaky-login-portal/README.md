# Leaky Login Portal

## Learning Objectives
- Understand SQL Injection vulnerabilities
- Learn how to exploit basic SQL Injection to bypass authentication
- Practice identifying insecure database queries

## Challenge Description
A small tech company has developed a login portal for their internal application. However, the developers overlooked a critical web security flaw, making it susceptible to SQL Injection. Your task is to exploit this vulnerability to bypass the login and retrieve the hidden flag.

## Setup Instructions
1. Use Docker Compose to set up the challenge environment:
   ```bash
   docker-compose up --build
   ```
2. Access the victim server at http://victim:8080 using the Kali Linux GUI provided in the attacker container.

## Goal
- Bypass the login form using SQL Injection.
- Locate the flag hidden on the server.

## Flag
The flag is: `CTF{sql_injection_success}`
