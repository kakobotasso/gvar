class Person < ActiveRecord::Base
  attr_accessible :address_attributes, :cpf, :name, :rg, :observations, :service_ids, :active
  has_one :address
  accepts_nested_attributes_for :address
end
