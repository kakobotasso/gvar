class Provider < Person
  attr_accessible :active
  has_and_belongs_to_many :services
end
