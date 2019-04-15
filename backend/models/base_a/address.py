from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class AddressModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_a'
    __tablename__ = 'address'
    id = db.Column(db.Integer, primary_key=True)
    person_id = db.Column(db.Integer, db.ForeignKey('person.id'))
    zipcode = db.Column(db.String(8), nullable=False)
    number = db.Column(db.String(15), nullable=False)
