from flask import Flask, request, render_template, redirect, url_for
import os

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload():
    # Vulnerable to XSS
    if 'file' in request.files:
        file = request.files['file']
        if file.filename != '':
            file.save(os.path.join('/var/www/html/uploads', file.filename))
    return redirect(url_for('index'))

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return f"<h1>File {filename} uploaded!</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)