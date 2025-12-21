# SQL Injection Login Bypass Challenge

## Learning Objectives
- Understand how SQL Injection can be used to bypass authentication
- Explore the effects of insufficient input validation
- Learn to craft SQL payloads to manipulate queries

## Challenge Description
The goal of this challenge is to exploit a SQL Injection vulnerability in the login form of a corporate portal. Due to improper sanitization of user inputs, it's possible to bypass authentication and gain access to the internal portal.

## How to Access
- This challenge can be accessed from the attacker container (Kali Linux) at http://victim:8080.

## Hints
1. Pay attention to the SQL query structure in the source code.
2. Think about how you can manipulate the query to always return true.
3. Consider using common SQL Injection payloads like `' OR '1'='1`. 

## Tags
- sql-injection
- web-security
- authentication