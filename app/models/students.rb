class Students < ActiveRecord::Base
  attr_accessible :address_delivered, :birth_date, :cellphone, :city, :code, :complement, :country, :cpf, :cpf_delivered, :cv_delivered, :name, :neighborhood, :notes, :number, :occupation, :phone, :photo_delivered, :relationship_elderly, :rg, :rg_delivered, :schooling, :sex, :street, :zipcode

  validates_presence_of :birth_date, :city, :code, :country, :cpf, :name, :neighborhood, :number, :occupation, :relationship_elderly, :rg, :schooling, :sex, :street, :zipcode
  validates_uniqueness_of :cpf, :rg

  def relacao_idoso
  	if relationship_elderly == 0
  		"Nao"
  	else
  		"Sim"
  	end
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
