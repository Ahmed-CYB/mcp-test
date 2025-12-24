from flask import Flask, render_template, jsonify
import os

app = Flask(__name__)

# Note: This key is intentionally weak for educational purposes
WEAK_KEY = "KEY"
ENCRYPTED_MESSAGE = "LXFOPVEFRNHR"
FLAG = "CTF{vigenere_decryption_success}"

@app.route('/')
def index():
    return render_template('index.html', encrypted_message=ENCRYPTED_MESSAGE)

@app.route('/flag')
def get_flag():
    # This endpoint is protected by the encryption challenge
    return jsonify({'flag': FLAG})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)