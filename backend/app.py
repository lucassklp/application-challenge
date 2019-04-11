from flask import Flask
import redis


r = redis.Redis(host='redis', port=6379, db=0)
r.set('abc', 'def')


app = Flask(__name__)


@app.route('/')
def hello_world():
    return r.get('abc')



if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
