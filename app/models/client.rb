class Client < Person
  has_many :schedules
  validates_presence_of :name, :cpf, :rg
end
