# -*- encoding:utf-8 -*-
class Service < ActiveRecord::Base
  attr_accessible :default_value, :description, :estimated_time, :inactive, :name, :number_days
  has_and_belongs_to_many :providers
  has_many :schedules

  validates_presence_of :default_value, :estimated_time, :name, :number_days

  def active
    self.inactive? ? "Não" : "Sim"
  end
end
