# Basic Auth Bypass Challenge

## Learning Objectives
- Understand how improper authorization checks can lead to authentication bypass.
- Learn to exploit basic web authentication mechanisms.

## Challenge Description
This challenge emulates a corporate login portal where a developer mistakenly left a backdoor in the authentication system. Your task is to find a way to bypass the login and access the user dashboard where the flag is located.

## Instructions
1. Start your Kali Linux environment.
2. Access the victim server at http://victim:8080.
3. Find a way to access the dashboard as a 'guest' user.

## Hints
- Check any differences in handling specific usernames during login.
- Try common usernames that might have special conditions.
- Read the login logic in `app.py` carefully.
