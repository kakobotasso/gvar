# -*- encoding:utf-8 -*-
class Provider < Person
  attr_accessible :active
  has_and_belongs_to_many :services

  def is_active
    self.active? ? "Sim" : "Não"
  end
end
