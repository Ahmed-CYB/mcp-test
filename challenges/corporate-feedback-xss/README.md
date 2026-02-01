# corporate-feedback-xss

## Description
A corporate feedback portal has been deployed with insufficient input validation. The application accepts user feedback but fails to properly sanitize HTML content, making it vulnerable to Cross-Site Scripting (XSS) attacks. Your goal is to exploit this vulnerability to retrieve the admin's session cookie.

## Scenario
TechCorp has deployed an internal feedback portal where employees can submit suggestions and comments. The portal stores feedback in a database and displays it to administrators for review. However, the development team rushed the deployment and skipped proper input validation. As a security tester, you need to demonstrate the XSS vulnerability by stealing the admin's session cookie when they review your feedback.

## Difficulty
medium

## Machines
- **feedback-portal** (victim): 172.21.145.197 - apache2, mysql
- **attacker** (attacker): 172.21.145.3 - 

## Hints
1. The feedback form doesn't seem to validate user input properly
2. Look for ways to inject JavaScript that executes when admins review feedback
3. You'll need to steal the admin's session cookie to access the flag - try setting up a listener to capture it

## Flag Format
CTF{xss_c00k13_st34l3r_m4st3r}
