from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class DebtsModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_a'
    __tablename__ = 'debts'

    id = db.Column(db.Integer, primary_key=True)
    person_id = db.Column(db.Integer, db.ForeignKey('person.id'))
    institution_id = db.Column(db.Integer, db.ForeignKey('institution.id'))
    value = db.Column(db.Numeric, nullable=False)
    register_date = db.Column(db.DateTime, nullable=False)
    payment_date = db.Column(db.DateTime, nullable=True)
