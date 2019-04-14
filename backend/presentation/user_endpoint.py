from flask_restful import Resource
from models.person import PersonModel


class UserRegistration(Resource):
    def post(self):
        person = PersonModel()
        person.cpf = '00000000000'
        person.name = 'Test'
        person.save()


class AllUsers(Resource):
    def get(self):
        return {'message': 'List of users'}

    def delete(self):
        return {'message': 'Delete all users'}
