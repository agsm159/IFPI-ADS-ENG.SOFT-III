#Exemplo de encapsulamento com python
'''  --------------------------- Antes ----------------------------- '''

''' Da maneira que se encontra o código, é possivel que o salario seja alterado no final sem que 
seja preciso usar-se da função "calcula_salario, sendo que o mesmo vale para "horas_trabalhadas".
Nesso ponto é se faz nescessario o uso da encapsulamento, como uma maneira de esconder as informações
que não serão visiveis ao cliente na classe'''


class Funcionario:
    def __init__(self, nome, cargo, valor_hora_trabalhada):
        self.nome = nome
        self.cargo = cargo
        self.valor_hora_trabalhada = valor_hora_trabalhada
        self.horas_trabalhadas = 0
        self.salario = 0

    def registra_hora_trabalhada(self):
        self.horas_trabalhadas += 1

    def calcula_salario(self):
        self.salario = self.horas_trabalhadas * self.valor_hora_trabalhada


'''  --------------------------- Depois ----------------------------- '''

'''Em python, se faz uso de duplo "_" que funciona como um "private" para tornar um 
metodo não visivel fora classe. Dessa forma ai se tentar alterar os metodos fora da classe,
um usuario que esses metodos não podem ser alterados.'''

class Funcionario:
    def __init__(self, nome, cargo, valor_hora_trabalhada):
        self.nome = nome
        self.cargo = cargo
        self.valor_hora_trabalhada = valor_hora_trabalhada
        self.__horas_trabalhadas = 0 
        self.__salario = 0 

    def registra_hora_trabalhada(self):
        self.horas_trabalhadas += 1

    def calcula_salario(self):
        self.__salario = self.__horas_trabalhadas * self.valor_hora_trabalhada
