# Exemplo do Principio da Segregação de Interfaca em Ruby

# Sobre o principio da Segregação de Interfaca, consiste em separar as classes principais
# em outras classes menores, para que os clientes usem apenas os metodos nescessarios a fim de
# se obter interfaces segregadas de acordo com sua respectiva finalidade

# --------------------------- Antes -----------------------------

# Nesse exemplo, de uma maquina de café com funções genêricas, usadas por dois tipo de classes
# que são as "Person" e "Staff", entretando a classe "CoffeeMachineInterface" faz uso de funções
# que nem sempre ira usar, assim ferindo o principio da Segregação de Interfaca, de modo que se faz
# necessario separar a classe "CoffeeMachineInterface" em outras duas que sirvam contanham apenas
# as funções usadas pelas classes "Person" e "Staff".

class CoffeeMachineInterface
    def select_drink_type
        # select drink type logic
    end
  
    def select_portion
       # select portion logic
    end
  
    def select_sugar_amount
       # select sugar logic
    end
  
    def brew_coffee
       # brew coffee logic
    end
  
    def clean_coffee_machine
      # clean coffee machine logic
    end
  
    def fill_coffee_beans
      # fill coffee beans logic
    end
  
    def fill_water_supply
      # fill water logic
    end
  
    def fill_sugar_supply
      # fill sugar logic
    end
end
  
class Person
    def initialize
      @coffee_machine = CoffeeMachineInterface.new
    end
  
    def make_coffee
      @coffee_machine.select_drink_type
      @coffee_machine.select_portion
      @coffee_machine.select_sugar_amount
      @coffee_machine.brew_coffee
    end
end
  
class Staff
    def initialize
      @coffee_machine = CoffeeMachineInterface.new
    end
  
    def serv
      @coffee_machine.clean_coffee_machine
      @coffee_machine.fill_coffee_beans
      @coffee_machine.fill_water_supply
      @coffee_machine.fill_sugar_supply
    end
end

  # --------------------------- Depois -----------------------------

# Feita a correções necassarios para que a classe "CoffeeMachineInterface" fosse separada em duas,
# o código agora atende aos principios da Segregação de Interfaca, evitando assim a utilização de funções
# desnecessarias, oque por sua vez facilitaria a adiçõa de novas funções que podem server para apenas uma
# das outras classes.

class CoffeeMachineUserInterface
    def select_drink_type
        # select drink type logic
    end
  
    def select_portion
       # select portion logic
    end
  
    def select_sugar_amount
       # select sugar logic
    end
  
    def brew_coffee
       # brew coffee logic
    end
end
  
class CoffeeMachineServiceInterface
    def clean_coffee_machine
      # clean coffee machine logic
    end
  
    def fill_coffee_beans
      # fill coffee beans logic
    end
  
    def fill_water_supply
      # fill water logic
    end
  
    def fill_sugar_supply
      # fill sugar logic
    end
end
  
class Person
    def initialize
        @coffee_machine = CoffeeMachineUserInterface.new
    end

    def make_coffee
        @coffee_machine.select_drink_type
        @coffee_machine.select_portion
        @coffee_machine.select_sugar_amount
        @coffee_machine.brew_coffee
    end
end
  
class Staff
    def initialize
      @coffee_machine = CoffeeMachineServiceInterface.new
    end
  
    def serv
      @coffee_machine.clean_coffee_machine
      @coffee_machine.fill_coffee_beans
      @coffee_machine.fill_water_supply
      @coffee_machine.fill_sugar_supply
    end
end
