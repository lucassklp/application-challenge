from persistence.mysql import db

class PersonModel(db.Model):
    __tablename__ = 'person'
    id = db.Column(db.Integer, primary_key=True)
    cpf = db.Column(db.String(11), nullable=False)
    name = db.Column(db.String(255))

    def save(self):
        db.session.add(self)
        db.session.commit()

    @classmethod
    def find_by_username(cls, name):
        return cls.query.filter_by(name=name).first()
