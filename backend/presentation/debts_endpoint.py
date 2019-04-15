from flask_restful import Resource, request
from business import debts_service
from flask_jwt_extended import jwt_required

class DebtsEndpoint(Resource):
    @jwt_required
    def post(self):
        json = request.get_json()
        return debts_service.query(json['cpf'])
