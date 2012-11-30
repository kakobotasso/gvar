class Student < Person
  validates_presence_of :birth_date, :cpf, :name, :occupation, :relationship_elderly, :rg, :schooling, :sex
  validates_uniqueness_of :cpf, :rg

  has_many :registrations
  has_many :teams, :through => :registrations

  def relacao_idoso
  	if relationship_elderly == 0
  		"Nao"
  	else
  		"Sim"
  	end
  end

  def sexo
  	if sex == 0
  		"Masculino"
  	else
  		"Feminino"
  	end
  end

  def estado
    Country::STATES.rassoc(country)[0]
  end

  SEXO = [
    ["Masculino", 0],
    ["Feminino", 1]
  ]

  RELACAO = [
    ["Sim", 0],
    ["Nao", 1]
  ]

end
