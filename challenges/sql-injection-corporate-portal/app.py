# Main application
# Vulnerable to: SQL Injection
from flask import Flask, render_template, request, redirect, url_for, flash
import sqlite3
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)

DATABASE = 'corporate.db'

# Database setup
def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/', methods=['GET', 'POST'])

def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = get_db_connection()
        query = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'"
        user = conn.execute(query).fetchone()
        conn.close()
        if user:
            flash('Login successful!')
            return redirect(url_for('dashboard'))
        else:
            flash('Login failed. Please check your credentials.')
    return render_template('index.html')

@app.route('/dashboard')

def dashboard():
    return render_template('dashboard.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
