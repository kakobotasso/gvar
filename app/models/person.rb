class Person < ActiveRecord::Base
  attr_accessible :address_attributes, :cpf, :name, :rg, :observations, :service_ids, :active, :address_delivered, :birth_date, :cpf_delivered, :cv_delivered, :notes, :occupation, :photo_delivered, :relationship_elderly, :rg_delivered, :schooling, :sex

  has_one :address
  accepts_nested_attributes_for :address
  has_many :phones
  accepts_nested_attributes_for :phones
end
