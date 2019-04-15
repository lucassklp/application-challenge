from persistence.mysql import db
from sqlalchemy_serializer import SerializerMixin


class InstitutionModel(db.Model, SerializerMixin):
    __bind_key__ = 'base_a'
    __tablename__ = 'institution'
    id = db.Column(db.Integer, primary_key=True)
    company_name = db.Column(db.String(45), nullable=False)
    cnpj = db.Column(db.String(14), nullable=False)
    debts = db.relationship("DebtsModel")
