# Exemplo de violação do Princípio da Responsabilidade Única em Ruby

# Considerando que nesse principio as classes ou objetos devem ter apenas uma resposabilidade,
# sendo que essa responsabilidade, deve ser encapsulada pela classe.

# --------------------------- Antes -----------------------------

class FinancialReportMailer

  # Nesse exemplo a classe "FinancialReportMailer" tem duas responsabilidades, que são
  # "generate_report!" e "send_report"

    def initialize(transactions, account)
      @transactions = transactions
      @account = account
      @report = ''
    end
  
    # Método responsavel por gerar o relatório
    def generate_report!
      @report = @transactions.map {
        |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
      }.join("\n")
    end
  
    # Método responsavel por enviar o relatório
    def send_report
      Mailer.deliver(
        from: 'reporter@example.com',
        to: @account.email,
        subject: 'your report',
        body: @report
      )
    end
end
  
  mailer = FinancialReportMailer.new(transactions, account)
  mailer.generate_report!
  mailer.send_report

  # Assim, ferindo o principio da responsabilidade única, a classe "FinancialReportMailer"
  # deve ser dividida em duas classes, uma para gerar o relatório e outra para enviar o relatório.

# --------------------------- Depois -----------------------------

# Após ser dividida, a classe "FinancialReportMailer" se torna outras duas classes, sendo elas:

class FinancialReportMailer # Classe responsavel por criar os relatórios.
  def initialize(report, account)
    @report = report
    @account = account
  end

  def deliver
    Mailer.deliver(
      from: 'reporter@example.com',
      to: @account.email,
      subject: 'Financial report',
      body: @report
    )
  end
end

class FinancialReportGenerator # Classe responsavel por enviar os relatórios.
  def initialize(transactions)
    @transactions = transactions
  end

  def generate
    @transactions.map { |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"
    }.join("\n")
  end
end

report = FinancialReportGenerator.new(transactions).generate
FinancialReportMailer.new(report, account).deliver

# Dessa forma se torna melhor a manutenção para o caso de futuras atualizações.
