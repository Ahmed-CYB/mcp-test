#!/usr/bin/env python3
"""
Rail Fence Cipher Decoder
TechCorp Security Tools - Project Phoenix

Usage: python3 rail_fence_decoder.py <ciphertext> <num_rails>
"""

import sys

def rail_fence_decrypt(ciphertext, num_rails):
    if num_rails == 1:
        return ciphertext
    
    # Create the rail matrix
    rail = [['\n' for i in range(len(ciphertext))] for j in range(num_rails)]
    
    # Mark the places with '*'
    dir_down = False
    row, col = 0, 0
    
    for i in range(len(ciphertext)):
        if row == 0 or row == num_rails - 1:
            dir_down = not dir_down
        rail[row][col] = '*'
        col += 1
        if dir_down:
            row += 1
        else:
            row -= 1
    
    # Fill the rail matrix
    index = 0
    for i in range(num_rails):
        for j in range(len(ciphertext)):
            if rail[i][j] == '*' and index < len(ciphertext):
                rail[i][j] = ciphertext[index]
                index += 1
    
    # Read the matrix in zigzag manner
    result = []
    row, col = 0, 0
    dir_down = False
    
    for i in range(len(ciphertext)):
        if row == 0 or row == num_rails - 1:
            dir_down = not dir_down
        if rail[row][col] != '*':
            result.append(rail[row][col])
        col += 1
        if dir_down:
            row += 1
        else:
            row -= 1
    
    return ''.join(result)

def binary_to_ascii(binary_string):
    # Split by spaces and convert each 8-bit chunk to ASCII
    binary_values = binary_string.split()
    ascii_chars = [chr(int(b, 2)) for b in binary_values]
    return ''.join(ascii_chars)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 rail_fence_decoder.py <binary_ciphertext> <num_rails>")
        print("Example: python3 rail_fence_decoder.py '01000001 01000010' 3")
        sys.exit(1)
    
    binary_cipher = sys.argv[1]
    rails = int(sys.argv[2])
    
    # First convert binary to ASCII
    ascii_text = binary_to_ascii(binary_cipher)
    print(f"Binary decoded to: {ascii_text}")
    
    # Then decrypt with rail fence
    decrypted = rail_fence_decrypt(ascii_text, rails)
    print(f"Rail fence decrypted ({rails} rails): {decrypted}")