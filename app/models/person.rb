class Person < ActiveRecord::Base
  attr_accessible :address_id, :cpf, :name, :rg, :observations
  has_one :address
end
