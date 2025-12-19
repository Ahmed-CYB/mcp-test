# Main application
# Vulnerable to: SQL Injection
from flask import Flask, render_template, request, redirect, url_for, flash
import sqlite3
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)

DATABASE = 'database.db'

# Database connection function
def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

# Initialize the database
with app.app_context():
    conn = get_db_connection()
    conn.executescript('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            password TEXT NOT NULL
        );
        INSERT INTO users (username, password) VALUES ('admin', 'admin123');
    ''')
    conn.commit()
    conn.close()

# Home route
@app.route('/')
def index():
    return render_template('index.html')

# Login route
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = get_db_connection()
        user = conn.execute("SELECT * FROM users WHERE username = '{}' AND password = '{}'".format(username, password)).fetchone()
        conn.close()
        if user:
            flash('Logged in successfully!', category='success')
            return redirect(url_for('dashboard'))
        else:
            error = 'Invalid credentials'
    return render_template('login.html', error=error)

# Dashboard route
@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

# Run the application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)