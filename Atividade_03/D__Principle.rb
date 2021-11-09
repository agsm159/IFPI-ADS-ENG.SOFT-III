# Exemplo de uso do Princípio da Inversão de Depêndecia em Ruby

# Sobre o Princípio da Inversão de Dependência, os modulos de alto nível não devem
# depender dos modulos de baixo nível. Mas ambos devem depender de abstrações. 

# --------------------------- Antes -----------------------------

# Nesses exemplo, a classe "Printer" tem depencia das classes "PdfFormatter" e "HtmlFormatter",
# o que viola o princípio da inversão de dependência, ja que a classe alta "Printer" depende de outras 
# duas classes baixas.

class Printer
    def initialize(data)
      @data = data
    end
  
    def print_pdf
      PdfFormatter.new.format(@data)
    end
  
    def print_html
      HtmlFormatter.new.format(@data)
    end
end
  
class PdfFormatter
    def format(data)
      # format data to Pdf logic
    end
end
  
  class HtmlFormatter
    def format(data)
      # format data to Html logic
    end
end

# --------------------------- Depois -----------------------------

# Após as alterações para se corresponder aos principios da inversão de dependência, a classe "Printer"
# já não depende das outras classes baixas e os modulos agora dependem apenas das abstrações. Além de que
# como vantagem da classe alta não depender de classes baixas, torna-se mais facil de se fazer alterações
# nessas classes sem que isso cause problemas em todo sistema.

class Printer
    def initialize(data)
      @data = data
    end
  
    def print(formatter: PdfFormatter.new)
      formatter.format(@data)
    end
end
  
class PdfFormatter
    def format(data)
      # format data to Pdf logic
    end
end
  
  class HtmlFormatter
    def format(data)
      # format data to Html logic
    end
end
