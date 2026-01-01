#!/usr/bin/env python3
import base64
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2
from Crypto.Hash import SHA256
import sys

def decrypt_file(encrypted_content, password):
    try:
        # Remove 'Salted__' prefix and get salt
        encrypted_data = base64.b64decode(encrypted_content.split('\n')[0])
        
        if encrypted_data[:8] != b'Salted__':
            return None
            
        salt = encrypted_data[8:16]
        ciphertext = encrypted_data[16:]
        
        # Derive key using PBKDF2
        key = PBKDF2(password, salt, dkLen=32, count=10000, hmac_hash_module=SHA256)
        
        # Decrypt
        cipher = AES.new(key, AES.MODE_CBC, salt)
        decrypted = cipher.decrypt(ciphertext)
        
        # Remove padding
        padding_len = decrypted[-1]
        return decrypted[:-padding_len].decode('utf-8')
        
    except Exception as e:
        return None

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python3 decrypt.py <encrypted_file> <password>')
        sys.exit(1)
        
    try:
        with open(sys.argv[1], 'r') as f:
            content = f.read()
            
        result = decrypt_file(content, sys.argv[2])
        if result:
            print(result)
        else:
            print('Decryption failed. Check password.')
            
    except FileNotFoundError:
        print('File not found')
    except Exception as e:
        print(f'Error: {e}')