class Address < ActiveRecord::Base
  attr_accessible :address, :city, :complement, :country_id, :neighborhood, :number, :zipcode
  validates_presence_of :address, :city, :country_id, :neighborhood, :number, :zipcode
  belongs_to :person
end
