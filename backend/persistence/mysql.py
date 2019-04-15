from flask_sqlalchemy import SQLAlchemy

db: SQLAlchemy = None

def configure(app):

    import pymysql
    pymysql.install_as_MySQLdb()


    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:example@mysql/auth_base'
    app.config['SQLALCHEMY_BINDS'] = {
        'base_a': 'mysql://root:example@mysql/base_a',
        'base_b': 'mysql://root:example@mysql/base_b',
    }
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'example'
    return SQLAlchemy(app)
