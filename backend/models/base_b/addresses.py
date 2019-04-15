from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class AddressesModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_b'
    __tablename__ = 'addresses'
    id = db.Column(db.Integer, primary_key=True)
    person_id = db.Column(db.Integer, db.ForeignKey('personal_score.id'))
    zipcode = db.Column(db.String(8), nullable=False)
    number = db.Column(db.String(15), nullable=False)
