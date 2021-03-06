# *-* encoding: UTF-8 *-*
module Category
  #
  # @categories = Category::OPTIONS
  #
  # select_tag :category_id, options_for_select(@categories)
  #
  # ira gerar:
  #
  # <select id="payment_id" name="payment_id"><option value="0">Dinheiro</option>
  #   <option value="1">Cheque</option>
  #   <option value="2">Cheque-pre</option>
  #   <option value="3">Cartão Debito</option>
  #   <option value="4">Cartão Credito</option>
  # </select>
  OPTIONS = []
  padroes = %w(Alimentação Educação Encargos Manutenção Lazer Pessoais Saúde Transporte Tributos Diversas)
  padroes.each_with_index do |option,indice|
    OPTIONS << [option,indice]
  end

  module Courses
    OPTIONS = [
      ["Curso Regular"       , 0],
      ["Palestra"         , 1],
      ["Workshop"     , 2]
    ]
    STATUS = [
      ["Gerada com sucesso", 0],
      ["Cancelada", 1]
    ]
  end

  module Seasons
    OPTIONS = [
      ["Manha"  , 0],
      ["Tarde"  , 1],
      ["Noite"  , 2]
    ]
  end

  module Interested
    SITUATION = [
      ["Ativo",   0],
      ["Inativo", 1],
      ["Aluno",   2]
    ]
  end

  DECISION = [
    ["Sim", 0],
    ["Não", 1]
  ]

  SEX = [
    ["Masculino", 0],
    ["Feminino",  1]
  ]
end
