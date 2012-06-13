class Role < ActiveRecord::Base
  attr_accessible :name
  ROLES = %w[admin pagamento recebimento curso servico acessoria]
end
