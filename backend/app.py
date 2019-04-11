from flask import Flask
import redis

r = redis.Redis(host='redis', port=6379, db=0)
r.set('foo', 'bar')

app = Flask(__name__)

@app.route('/')
def hello_world():
    return r.get('foo')

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
