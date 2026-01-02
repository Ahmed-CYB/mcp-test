#!/usr/bin/env python3
# Simple decryption utility for staging environment
# Usage: python3 decrypt_tool.py <encrypted_file>

import sys
import base64

def simple_decrypt(data):
    # Remove base64 encoding first
    try:
        decoded = base64.b64decode(data)
        # Simple ROT13 variant for staging
        result = ""
        for char in decoded.decode('utf-8', errors='ignore'):
            if char.isalpha():
                if char.islower():
                    result += chr((ord(char) - ord('a') + 13) % 26 + ord('a'))
                else:
                    result += chr((ord(char) - ord('A') + 13) % 26 + ord('A'))
            else:
                result += char
        return result
    except:
        return data

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 decrypt_tool.py <file>")
        sys.exit(1)
    
    try:
        with open(sys.argv[1], 'r') as f:
            content = f.read()
            decrypted = simple_decrypt(content)
            print(decrypted)
    except FileNotFoundError:
        print("File not found")
    except Exception as e:
        print(f"Error: {e}")