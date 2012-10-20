class Students < ActiveRecord::Base
  attr_accessible :address_delivered, :birth_date, :cellphone, :city, :code, :complement, :country, :cpf, :cpf_delivered, :cv_delivered, :name, :neighborhood, :notes, :number, :occupation, :phone, :photo_delivered, :relationship_elderly, :rg, :rg_delivered, :schooling, :sex, :street, :zipcode

  validates_presence_of :birth_date, :city, :code, :country, :cpf, :name, :neighborhood, :number, :occupation, :relationship_elderly, :rg, :schooling, :sex, :street, :zipcode
  validates_uniqueness_of :cpf, :rg

end
