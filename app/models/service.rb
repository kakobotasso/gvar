class Service < ActiveRecord::Base
  attr_accessible :default_value, :description, :estimated_time, :inactive, :name, :number_days
  has_and_belongs_to_many :providers
end
