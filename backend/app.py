import time
from flask import Flask
from flask_restful import Api
from persistence import mysql
import jwt_configuration

# Delay para script do banco de dados
print('Waiting for database script init...')
time.sleep(30)

# Initializing
app = Flask(__name__)
mysql.db = mysql.configure(app)
api = Api(app)
jwt_configuration.jwt = jwt_configuration.configure(app)

# Configuring endpoints
from presentation import auth_endpoint, debts_endpoint, score_endpoint, track_cpf_endpoint

api.add_resource(auth_endpoint.AuthEndpoint, '/login')
api.add_resource(debts_endpoint.DebtsEndpoint, '/debts')
api.add_resource(score_endpoint.ScoreEndpoint, '/score')
api.add_resource(track_cpf_endpoint.TrackCpfEndpoint, '/track-cpf')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
