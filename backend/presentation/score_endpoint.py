from flask_restful import Resource, request
from business import score_service
from flask_jwt_extended import jwt_required

class ScoreEndpoint(Resource):
    @jwt_required
    def post(self):
        json = request.get_json()
        return score_service.query(json['cpf'])
