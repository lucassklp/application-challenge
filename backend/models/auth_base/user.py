from persistence.mysql import db

class UserModel(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(45))
    password = db.Column(db.String(500), nullable=False)
    email = db.Column(db.String(500), nullable=False)

    def save(self):
        db.session.add(self)
        db.session.commit()

    @classmethod
    def find_by_username_and_password(cls, name, passwd):
        return cls.query.filter_by(username=name, password=passwd).first()
