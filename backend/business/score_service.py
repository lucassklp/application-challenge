from models.base_b.person import PersonalScoreModel


def query(cpf):
    return PersonalScoreModel.find_by_cpf(cpf)
