from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class PersonModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_a'
    __tablename__ = 'person'
    __table_args__ = {"info": {"bind_key": "base_a"}}

    id = db.Column(db.Integer, primary_key=True)
    cpf = db.Column(db.String(11), nullable=False)
    name = db.Column(db.String(255))
    addresses = db.relationship("AddressModel")
    debts = db.relationship("DebtsModel")

    def save(self):
        db.session.add(self)
        db.session.commit()

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(id=id).first()

    @classmethod
    def find_by_cpf(cls, cpf):
        result = cls.query.filter_by(cpf=cpf).first()
        return result.to_dict(rules=('-debts.person_id', '-addresses.person_id'))
