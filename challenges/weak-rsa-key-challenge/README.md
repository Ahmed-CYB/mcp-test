# Weak RSA Key Challenge

## Learning Objectives
- Understand the importance of key size in RSA encryption
- Learn how to factorize weak RSA keys
- Use mathematical tools to break encryption

## Scenario
A cybersecurity company, SecureCorp, has deployed an RSA encryption system with weak keys. Exploit this vulnerability to decrypt a confidential message.

## Access Instructions
Use the Kali Linux container to access the victim service at http://victim:8080

## Hints
1. Investigate the key size used in the encryption process.
2. Consider techniques for factorizing the RSA modulus.
3. Use tools like `rsatool` or `yafu` to factorize the modulus and extract the private key.
