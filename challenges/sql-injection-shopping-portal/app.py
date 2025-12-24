# Main application for the SQL Injection challenge
from flask import Flask, request, render_template
import sqlite3
import os

app = Flask(__name__)

# Ensure the database file exists
DB_PATH = 'users.db'
if not os.path.exists(DB_PATH):
    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    c.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)')
    c.execute("INSERT INTO users (username, password) VALUES ('admin', 'supersecret')")
    conn.commit()
    conn.close()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    conn = sqlite3.connect(DB_PATH)
    c = conn.cursor()
    query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
    c.execute(query)
    user = c.fetchone()
    conn.close()

    if user:
        return 'Welcome, admin! The flag is: CTF{sql_injection_conquered}'
    else:
        return 'Invalid credentials!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
