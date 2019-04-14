from flask_sqlalchemy import SQLAlchemy

db: SQLAlchemy = None

def configure(app):

    import pymysql
    pymysql.install_as_MySQLdb()


    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:example@localhost:3307/base_a'
    app.config['SQLALCHEMY_BINDS'] = {
        'base_b': 'mysql://root:example@mysql/base_b',
        'users': 'mysql://mysql/users'
    }
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'example'
    return SQLAlchemy(app)
