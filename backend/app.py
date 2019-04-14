from flask import Flask
from flask_restful import Api
from persistence import mysql

# Initializing
app = Flask(__name__)
mysql.db = mysql.configure(app)
api = Api(app)

# Configuring endpoints
from presentation import auth_endpoint, user_endpoint

api.add_resource(user_endpoint.UserRegistration, '/registration')
api.add_resource(auth_endpoint.UserLogin, '/login')
api.add_resource(auth_endpoint.UserLogoutAccess, '/logout/access')
api.add_resource(auth_endpoint.UserLogoutRefresh, '/logout/refresh')
api.add_resource(auth_endpoint.TokenRefresh, '/token/refresh')
api.add_resource(user_endpoint.AllUsers, '/users')

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
