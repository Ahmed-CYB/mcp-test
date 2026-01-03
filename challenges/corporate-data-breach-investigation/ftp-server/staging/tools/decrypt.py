#!/usr/bin/env python3
# Corporate File Decryption Tool
# Usage: python3 decrypt.py <encrypted_file> <key>

import sys
import base64
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2
from Crypto.Hash import SHA256
from Crypto.Random import get_random_bytes

def decrypt_file(encrypted_data, password):
    try:
        # Decode base64
        encrypted_data = base64.b64decode(encrypted_data)
        
        # Extract salt (first 8 bytes after 'Salted__')
        if encrypted_data[:8] != b'Salted__':
            raise ValueError('Invalid file format')
        
        salt = encrypted_data[8:16]
        ciphertext = encrypted_data[16:]
        
        # Derive key using PBKDF2
        key = PBKDF2(password, salt, 32, count=1000, hmac_hash_module=SHA256)
        iv = PBKDF2(password, salt, 16, count=1000, hmac_hash_module=SHA256)
        
        # Decrypt
        cipher = AES.new(key, AES.MODE_CBC, iv)
        decrypted = cipher.decrypt(ciphertext)
        
        # Remove padding
        padding_len = decrypted[-1]
        decrypted = decrypted[:-padding_len]
        
        return decrypted.decode('utf-8')
    
    except Exception as e:
        return f'Decryption failed: {str(e)}'

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python3 decrypt.py <base64_encrypted_data> <key>')
        sys.exit(1)
    
    encrypted_data = sys.argv[1]
    key = sys.argv[2]
    
    result = decrypt_file(encrypted_data, key)
    print(result)