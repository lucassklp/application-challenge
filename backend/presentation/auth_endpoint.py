from flask_restful import Resource

class UserLogin(Resource):
    def post(self):
        return {'message': 'User login'}

class UserLogoutAccess(Resource):
    def post(self):
        return {'message': 'User logout'}

class UserLogoutRefresh(Resource):
    def post(self):
        return {'message': 'User logout'}

class TokenRefresh(Resource):
    def post(self):
        return {'message': 'Token refresh'}