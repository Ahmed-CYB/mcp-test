from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

# Connect to the SQLite database
DATABASE = 'users.db'

# Initialize the database with one user
def init_db():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE IF NOT EXISTS users (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        username TEXT NOT NULL,
                        password TEXT NOT NULL)''')
    cursor.execute("INSERT INTO users (username, password) VALUES ('admin', 'password123')")
    conn.commit()
    conn.close()

# Route for the login page
@app.route('/', methods=['GET', 'POST'])
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = sqlite3.connect(DATABASE)
        cursor = conn.cursor()
        query = "SELECT * FROM users WHERE username = ? AND password = ?"
        cursor.execute(query, (username, password))
        result = cursor.fetchone()
        conn.close()
        if result:
            return 'Login successful! Flag: CTF{sql_injection_bypass}'
        else:
            error = 'Invalid credentials'
    return render_template('login.html', error=error)

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=8080)