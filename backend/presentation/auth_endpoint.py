from flask_restful import Resource, request
from flask_jwt_extended import create_access_token
from business import auth_service

class AuthEndpoint(Resource):
    def post(self):
        json = request.get_json()

        user = auth_service.login(json['username'], json['password'])
        if(user != None):
            data = {'user_id': user.id, 'username': user.username, 'email': user.email}
            return {'token': create_access_token(data)}

        return {'message': 'invalid-credentials'}, 401
