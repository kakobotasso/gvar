class Role < ActiveRecord::Base
  attr_accessible :name
  ROLES = %w[admin pagamento recebimento curso servico assessoria]
  has_and_belongs_to_many :users
end
