from models.auth_base.user import UserModel
import hashlib


def login(username, password):
    passwd = hashlib.sha3_512(password.encode('utf-8')).hexdigest()
    return UserModel.find_by_username_and_password(username, passwd)


def register(username, password, email):
    passwd = hashlib.sha3_512(password.encode('utf-8')).hexdigest()
    user = UserModel(username=username, password=passwd, email=email)
    user.save()
