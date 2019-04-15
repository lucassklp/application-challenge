from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class PersonalScoreModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_b'
    __tablename__ = 'personal_score'

    id = db.Column(db.Integer, primary_key=True)
    cpf = db.Column(db.String(11), nullable=False)
    age = db.Column(db.Integer)
    addresses = db.relationship("AddressesModel")
    incomes = db.relationship("IncomesModel")
    goods = db.relationship("GoodsModel")

    def save(self):
        db.session.add(self)
        db.session.commit()

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(id=id).first()

    @classmethod
    def find_by_cpf(cls, cpf):
        result = cls.query.filter_by(cpf=cpf).first()
        return result.to_dict()
