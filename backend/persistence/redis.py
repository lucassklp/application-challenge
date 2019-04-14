import redis

redis_ultimas_consultas_cpf = redis.Redis(host='redis', port=6379, db=0)
redis_movimentacao_financeira = redis.Redis(host='redis', port=6379, db=1)
redis_ultimas_compras = redis.Redis(host='redis', port=6379, db=2)

