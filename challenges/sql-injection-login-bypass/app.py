# Main application
# Vulnerable to: SQL Injection
from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

DATABASE = 'database.db'

# Initialize database with a users table
with sqlite3.connect(DATABASE) as conn:
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)''')
    cursor.execute('''INSERT INTO users VALUES ('admin', 'admin123')''')
    conn.commit()

@app.route('/', methods=['GET', 'POST'])
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        # Vulnerable SQL query
        query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
        with sqlite3.connect(DATABASE) as conn:
            cursor = conn.cursor()
            cursor.execute(query)
            user = cursor.fetchone()
            if user:
                return redirect(url_for('success'))
            else:
                error = 'Invalid username or password'
    return render_template('login.html', error=error)

@app.route('/success')
def success():
    return '<h1>Login successful. Flag is in /flag.txt</h1>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
