class Role < ActiveRecord::Base
  attr_accessible :name
  ROLES = %w[admin pagamento recebimento curso servico acessoria]
  has_and_belongs_to_many :users
end
