# SQL Injection Login Bypass

## Learning Objectives
- Understand the impact of SQL Injection vulnerabilities
- Learn how to exploit SQL Injection for authentication bypass
- Practice identifying and exploiting SQL vulnerabilities

## Challenge Description
Your task is to gain unauthorized access to the SecureCorp employee portal. By exploiting SQL Injection vulnerabilities, bypass the login system and retrieve the flag from the admin dashboard.

## Access Instructions
- Run `docker-compose up` to start the challenge
- Access the portal via the Kali Linux environment at `http://victim:8080`

## Hints
1. Look for ways to manipulate SQL queries with user input.
2. Consider how authentication systems verify credentials.
3. What classic SQL Injection payload could bypass such a system?
