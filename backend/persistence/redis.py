import redis
import json

conn = redis.Redis(host='redis', port=6379, db=0)

# Para fins de simplificação, o mock será montado na hora de execução no Redis.

obj = {
    'cpf': '00000000000',
    'last_query': '2019-04-15T15:53:00+03:00',
    'financial_movements': [
        {
            'value': 2500,
            'operation': 'debit',
            'institution': 'Electronic Saler',
            'date': '2019-01-17T16:12:15+03:00'
        },
        {
            'value': 2000,
            'operation': 'debit',
            'institution': 'Electronic Saler',
            'date': '2019-02-25T17:26:42+03:00'
        }
    ],
    'last_buy': {
        'card_bin': '516832******4142',
        'value': 3200,
        'installment': 3,
        'soft_descriptor': 'Car Autoservice',
        'type': 'credit_card'
    }
}

conn.set('00000000000', json.dumps(obj))

def query(cpf):
    return json.loads(conn.get(cpf))
