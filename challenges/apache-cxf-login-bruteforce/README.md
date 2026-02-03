# apache-cxf-login-bruteforce

## Description
A web application running Apache CXF with a vulnerable login system that can be brute-forced. The application has weak password policies and no rate limiting, making it susceptible to credential attacks. Your goal is to identify valid credentials and access the protected area to retrieve the flag.

## Scenario
You've discovered a corporate web application running Apache CXF that handles employee authentication. Intelligence suggests that the application uses common passwords and has no brute-force protection. Your mission is to identify valid credentials through systematic password attacks and access the restricted area containing sensitive information.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **cxf-webapp** (victim): 172.30.145.180 - http

## Hints
1. The web application is running on a standard HTTP port. Start with reconnaissance to identify the login endpoint.
2. Look for common login paths like /login, /admin, or /auth. The application may reveal information about valid usernames.
3. Try common username/password combinations first. The application uses weak credentials that can be found in standard wordlists like rockyou.txt.

## Flag Format
CTF{...}
