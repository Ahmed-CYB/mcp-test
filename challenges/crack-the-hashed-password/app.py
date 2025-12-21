# Vulnerable to unsalted MD5 hashing
from flask import Flask, render_template, request, redirect, url_for, session
import hashlib

app = Flask(__name__)
app.secret_key = 'super_secret_key'

# Simulate a database with a single user
users = {
    'admin': hashlib.md5('password123'.encode()).hexdigest()
}

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        hashed_password = hashlib.md5(password.encode()).hexdigest()

        if username in users and users[username] == hashed_password:
            session['username'] = username
            return redirect(url_for('dashboard'))
        else:
            return 'Invalid credentials', 403
    return render_template('login.html')

@app.route('/dashboard')
def dashboard():
    if 'username' in session:
        if session['username'] == 'admin':
            return 'Welcome admin! Here is your note: CTF{unsalted_md5_compromised}'
        return 'Welcome to your dashboard!'
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
