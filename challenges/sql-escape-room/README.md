# SQL Escape Room

## Learning Objectives
- Understand SQL Injection vulnerabilities and how they can be exploited
- Learn to identify unsafe SQL query practices
- Practice crafting injection payloads to retrieve sensitive information

## Challenge Description

Escape Room Inc. has a vulnerable login portal with poor SQL practices. Your mission is to infiltrate their system and retrieve the flag hidden in the database.

## Hints
- Think about how SQL queries can be manipulated with input data.
- Consider what happens if you close off a string literal in SQL.
- Try to comment out the rest of the query to bypass password checks.

## Deployment

- Access the victim's web server at http://victim:8080 from your Kali Linux environment.
- Use the tools available in Kali to develop and test your injection payloads.
