# Crack the Hashed Password

## Learning Objectives
- Understand the risks of using unsalted MD5 hashes for password storage.
- Learn how to use hashcat to crack MD5 hashed passwords.

## Challenge Description
A small startup, SecureVault, has launched a web application to showcase their 'unbreakable' password storage system. However, they have stored their passwords as unsalted MD5 hashes. Your mission is to exploit this vulnerability, crack the hashed password, and retrieve the flag stored as a note in the user's account.

## Access Instructions
- Use the Kali Linux desktop to attack the victim service at http://victim:8080
- Attempt to login and retrieve the stored note with the flag.

## Hints
- MD5 is an outdated and insecure hash algorithm.
- Use hashcat to crack the hashed password.
- The password is a common word appended with numbers.
