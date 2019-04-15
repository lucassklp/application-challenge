from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class GoodsModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_b'
    __tablename__ = 'goods'

    id = db.Column(db.Integer, primary_key=True)
    person_id = db.Column(db.Integer, db.ForeignKey('personal_score.id'))
    value = db.Column(db.Numeric, nullable=False)
    description = db.Column(db.String(150), nullable=False)
