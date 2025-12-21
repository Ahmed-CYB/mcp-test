# Main application
# Vulnerable to: Stored XSS
from flask import Flask, render_template, request, redirect, url_for, make_response
import os

app = Flask(__name__)

comments = []  # Store comments in memory

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        comment = request.form.get('comment')
        comments.append(comment)
        return redirect(url_for('index'))
    return render_template('index.html', comments=comments)

@app.route('/admin')
def admin():
    # Simulate an admin page that reads comments
    resp = make_response(render_template('admin.html', comments=comments))
    resp.set_cookie('session', 'admin-session-cookie')  # Simulate admin session cookie
    return resp

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
