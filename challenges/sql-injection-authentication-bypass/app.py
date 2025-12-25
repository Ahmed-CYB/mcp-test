from flask import Flask, render_template, request, redirect, url_for
import sqlite3
import os

app = Flask(__name__)

def init_db():
    conn = sqlite3.connect('users.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)''')
    c.execute("INSERT INTO users (username, password) VALUES ('admin', 'password123')")
    conn.commit()
    conn.close()

@app.route('/', methods=['GET', 'POST'])

def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if authenticate(username, password):
            return redirect(url_for('success'))
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('index.html', error=error)

def authenticate(username, password):
    conn = sqlite3.connect('users.db')
    c = conn.cursor()
    query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
    c.execute(query)
    user = c.fetchone()
    conn.close()
    return user is not None

@app.route('/success')

def success():
    return 'Welcome, admin! The flag is CTF{sql_injection_success}'

if __name__ == '__main__':
    if not os.path.exists('users.db'):
        init_db()
    app.run(host='0.0.0.0', port=8080)