from flask_restful import Resource, request
from business import track_cpf_service
from flask_jwt_extended import jwt_required

class TrackCpfEndpoint(Resource):
    @jwt_required
    def post(self):
        json = request.get_json()
        return track_cpf_service.query(json['cpf'])
