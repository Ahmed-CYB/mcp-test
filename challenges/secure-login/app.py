from flask import Flask, request, make_response
import hashlib

app = Flask(__name__)

users = {
    'admin': '21232f297a57a5a743894a0e4a801fc3'
}

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = hashlib.md5(request.form.get('password').encode()).hexdigest()
        if users.get(username) == password:
            resp = make_response('Logged in!')
            resp.set_cookie('username', username)
            return resp
        else:
            return 'Wrong credentials!'
    else:
        return '''<form method="POST">
        Username:<br><input type="text" name="username" /><br>
        Password:<br><input type="password" name="password" /><br>
        <input type="submit" value="Login" />
        </form>'''

@app.route('/flag')
def flag():
    if request.cookies.get('username') == 'admin':
        return 'CTF{C00kie_M0n5t3R}'
    else:
        return 'You are not admin!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)