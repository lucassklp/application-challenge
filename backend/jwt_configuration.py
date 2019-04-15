from flask_jwt_extended import JWTManager

jwt: JWTManager = None

def configure(app):
    app.config['PROPAGATE_EXCEPTIONS'] = True
    app.config['JWT_SECRET_KEY'] = 'c728181f0400fa2cc9be4f5024e91242'
    return JWTManager(app)
