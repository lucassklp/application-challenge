from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class IncomesModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_b'
    __tablename__ = 'source_of_income'

    id = db.Column(db.Integer, primary_key=True)
    person_id = db.Column(db.Integer, db.ForeignKey('personal_score.id'))
    value = db.Column(db.Numeric, nullable=False)
    description = db.Column(db.String(150), nullable=True)
    periodicity = db.Column(db.Integer, nullable=False)
