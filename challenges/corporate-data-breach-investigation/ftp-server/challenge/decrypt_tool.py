#!/usr/bin/env python3
# XOR Decryption Tool for Database Recovery

import binascii

def xor_decrypt(hex_data, key):
    """Decrypt hex-encoded XOR cipher"""
    try:
        # Convert hex to bytes
        encrypted_bytes = binascii.unhexlify(hex_data.replace('\n', ''))
        key_bytes = key.encode('utf-8')
        
        decrypted = bytearray()
        key_len = len(key_bytes)
        
        for i, byte in enumerate(encrypted_bytes):
            decrypted.append(byte ^ key_bytes[i % key_len])
        
        return decrypted.decode('utf-8', errors='ignore')
    except Exception as e:
        return f"Decryption failed: {e}"

if __name__ == "__main__":
    print("XOR Database Decryption Tool")
    print("Usage: python3 decrypt_tool.py")
    
    # Load encrypted database
    try:
        with open('/home/ftp/confidential/encrypted_database.db', 'r') as f:
            encrypted_data = f.read()
        
        # Load key from backup file
        with open('/home/ftp/system/backup_key.txt', 'r') as f:
            key_line = f.readline()
            key = key_line.split(': ')[1].strip()
        
        print(f"Using key: {key}")
        result = xor_decrypt(encrypted_data, key)
        print(f"Decrypted content: {result}")
        
    except FileNotFoundError as e:
        print(f"File not found: {e}")
        print("Make sure you have access to the FTP server files!")