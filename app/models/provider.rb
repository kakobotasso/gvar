# -*- encoding:utf-8 -*-
class Provider < Person
  attr_accessible :active
  has_and_belongs_to_many :services
  has_many :schedules

  validates_presence_of :name, :cpf, :rg

  def is_active
    self.active? ? "Sim" : "Não"
  end

  def estado
  	Country::STATES.rassoc(address.country_id)[0]
  end

end
