from flask import Flask, request
import mysql.connector
app = Flask(__name__)
@app.route('/')
def index():
    username = request.args.get('username')
    password = request.args.get('password')
    conn = mysql.connector.connect(user='root', password='root', host='db', database='chall')
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM users WHERE username='{username}' AND password='{password}'")
    users = cursor.fetchall()
    if users:
        return 'Welcome back!'
    else:
        return 'Invalid credentials!'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)