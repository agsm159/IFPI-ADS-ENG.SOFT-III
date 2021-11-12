#Exemplo de Coesão
# responsabilidade unica
#  --------------------------- Antes ----------------------------- 

'''Na seguinte classe "User", é guardado dados de um usuario em um banco de dados.
No caso de algumas das funções do banco de dados seja preciso alterar, todas as classes 
do usuario precisaram ser alteradas também para de adequarem as mudaças.'''

class  User:
    def __init__(self, name: str):
        self.name = name
    
    def get_name(self) -> str:
        pass

    def save(self, user: User):
        pass


# --------------------------- Depois -----------------------------

'''Como forma de cotornar esse problema, pode-se fazer a divisão das funções da classe "User"
em outra classe, de modo que, a classe User ficará responsavel apenas pelo gerenciamento do banco
de dados, enquanto a classe "UserDB" fica responsavel pelo registro de usuarios no banco de dados.'''

class User:
    def __init__(self, name: str):
            self.name = name
    
    def get_name(self):
        pass


class UserDB:
    def get_user(self, id) -> User:
        pass

    def save(self, user: User):
        pass
