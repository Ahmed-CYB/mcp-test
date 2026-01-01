#!/usr/bin/env python3
import base64
import hashlib

def decrypt_flag(encrypted_flag, key):
    """Decrypt the flag using the provided key"""
    try:
        # Decode base64
        encrypted_data = base64.b64decode(encrypted_flag.encode())
        
        # Generate key hash
        key_hash = hashlib.sha256(key.encode()).digest()
        
        # Decrypt
        decrypted = ''
        for i, byte_val in enumerate(encrypted_data):
            decrypted += chr(byte_val ^ key_hash[i % len(key_hash)])
        
        return decrypted
    except Exception as e:
        return f"Decryption failed: {e}"

if __name__ == '__main__':
    print("TechCorp Flag Decryption Utility")
    print("Usage: python3 flag_decryptor.py")
    print("")
    encrypted_flag = input("Enter encrypted flag: ")
    key = input("Enter decryption key: ")
    
    result = decrypt_flag(encrypted_flag, key)
    print(f"Decrypted flag: {result}")