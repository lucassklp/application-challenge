from models.base_a.person import PersonModel


def query(cpf):
    return PersonModel.find_by_cpf(cpf)
