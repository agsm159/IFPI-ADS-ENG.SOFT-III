# Exemplo do Principio da Subistituição de Liskov em Ruby

# Segundo esse principio de substituição de Liskov, as subclasses devem substituir
# as classes de modo que elas não causem problemas. A fim de garantir mais reutilização
# de código assim como melhor organizar as hierarquias de classes.

# --------------------------- Antes -----------------------------

# Nesse exemplo, na classe "UserStatistic", a subclasse "AdminStatistic" redefine a classe
# base, de modo que, é retornada uma string com os dados filtrados, sendo que o resultado
# esperado pela classe base é o retorno da matriz de postagens.

class UserStatistic
    def initialize(user)
      @user = user
    end
  
    def posts
      @user.blog.posts
    end
end
  
class AdminStatistic < UserStatistic
    def posts
      user_posts = super
  
      string = ''
      user_posts.each do |post|
        string += "title: #{post.title} author: #{post.author}\n" if post.popular?
      end
  
      string
    end
end

# --------------------------- Depois -----------------------------

# Fazendo a reformulação do código de modo a cumprir com o Principio da Subistituição de Liskov,
# é feita uma separação da filtragem e da geração de string para dois metodos, sendo eles respectivamente
# os metodos "posts" e "formatted_posts", dessa forma a subclasse "AdminStatistic" irá retornar os mesmos
# resultados da classe "UserStatistic".

class UserStatistic
    def initialize(user)
      @user = user
    end
  
    def posts
      @user.blog.posts
    end
end
  
class AdminStatistic < UserStatistic
    def posts
      user_posts = super
      user_posts.select { |post| post.popular? }
    end
  
    def formatted_posts
      posts.map { |post| "title: #{post.title} author: #{post.author}" }.join("\n")
    end
end
