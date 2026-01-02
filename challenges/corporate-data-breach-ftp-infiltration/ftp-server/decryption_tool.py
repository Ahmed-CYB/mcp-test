#!/usr/bin/env python3
"""
Rail Fence Cipher Decoder
For Corporate Data Breach Investigation
"""

import base64
import hashlib

def rail_fence_decode(ciphertext, key):
    """Decode rail fence cipher with given key"""
    rail = [[] for _ in range(key)]
    direction_down = False
    row = 0
    
    # Mark positions
    for i in range(len(ciphertext)):
        rail[row].append(i)
        if row == 0 or row == key - 1:
            direction_down = not direction_down
        row += 1 if direction_down else -1
    
    # Fill the rail with cipher characters
    index = 0
    for i in range(key):
        for j in range(len(rail[i])):
            rail[i][j] = ciphertext[index]
            index += 1
    
    # Read the message
    result = []
    direction_down = False
    row = 0
    
    for i in range(len(ciphertext)):
        result.append(rail[row].pop(0))
        if row == 0 or row == key - 1:
            direction_down = not direction_down
        row += 1 if direction_down else -1
    
    return ''.join(result)

def decode_base64(data):
    """Decode base64 data"""
    try:
        return base64.b64decode(data).decode('utf-8')
    except:
        return None

def verify_md5(text, expected_hash):
    """Verify MD5 hash"""
    actual_hash = hashlib.md5(text.encode()).hexdigest()
    return actual_hash == expected_hash

def main():
    # Example usage
    encrypted_data = "CF{ailecneiinhrcpoyrhpyto_fe_ne}T_rfnecptrgataisld_etdcr_iocfercui_nrporh_t_y__g"
    
    print("Rail Fence Cipher Decoder")
    print("=" * 25)
    
    for key in range(2, 6):
        print(f"\nTrying key {key}:")
        result = rail_fence_decode(encrypted_data, key)
        print(f"Result: {result}")
        
        if result.startswith('CTF{') and result.endswith('}'):
            print(f"*** POTENTIAL FLAG FOUND WITH KEY {key} ***")
            
    print("\nFor Base64 decoding, use:")
    print("decoded = decode_base64(base64_string)")
    print("\nFor hash verification:")
    print("verify_md5(flag, '7a8c4f2e1b9d3e5f6a2c8d4e9f1a3b5c')")

if __name__ == '__main__':
    main()