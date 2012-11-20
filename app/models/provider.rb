# -*- encoding:utf-8 -*-
class Provider < Person
  attr_accessible :active
  has_and_belongs_to_many :services
  has_many :schedules

  def is_active
    self.active? ? "Sim" : "Não"
  end
end
