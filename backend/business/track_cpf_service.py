from persistence import redis

def query(cpf):
    return redis.query(cpf)
