#!/usr/bin/env python3
import base64
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2
import sys

def decrypt_file(encrypted_content, password):
    try:
        # Decode base64
        encrypted_data = base64.b64decode(encrypted_content)
        
        # Extract salt (first 8 bytes)
        salt = encrypted_data[8:16]
        ciphertext = encrypted_data[16:]
        
        # Derive key using PBKDF2
        key = PBKDF2(password, salt, 32, count=1000)
        
        # Decrypt
        cipher = AES.new(key, AES.MODE_CBC, iv=encrypted_data[16:32])
        plaintext = cipher.decrypt(ciphertext[16:])
        
        # Remove padding
        pad_len = plaintext[-1]
        plaintext = plaintext[:-pad_len]
        
        return plaintext.decode('utf-8')
    except Exception as e:
        return f"Decryption failed: {str(e)}"

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 decrypt.py <encrypted_file> <password>")
        sys.exit(1)
    
    with open(sys.argv[1], 'r') as f:
        encrypted = f.read().strip()
    
    result = decrypt_file(encrypted, sys.argv[2])
    print(result)