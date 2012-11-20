Role::ROLES.each do |role|
  Role.create! :name => role
end

User.create!(
  :login => "admin",
  :name => "Administrador",
  :password => "test",
  :email => "admin@teste.com",
  :role_ids => [1]
)

User.create!(
  :login => "user",
  :name => "Usuario",
  :password => "test",
  :email => "user@teste.com",
  :role_ids => [2,4,6]
)

code = 1210021000
(1..50).each do |n|
  temp = (rand(10)+1)
  r = Payment.new do |r|
    r.code = "P#{code}"
    r.name = "Lancamento #{n}"
    r.category_id = rand(10)
    r.description = "Descricao #{n}"
  end
  (1..temp).each do |parcela|
    r.instalments << Instalment.create! do |i|
      i.number = parcela
      i.expiration_date = Date.today + (parcela * 10)
      i.amount = (temp * 100).to_s
      i.status_id = 0
      i.payment_id = 0
    end
  end
  r.total_amount = r.instalments.collect{|parcela| parcela.amount}.inject(:+).to_i.to_s
  r.number_instalments = r.instalments.size
  r.save
  code += 1
end

# Servicos
#
(1..10).each do |n|
  Service.create!(
    :name           => "Service n-#{n}",
    :number_days    => rand(10),
    :estimated_time => "#{rand(10)}horas",
    :default_value  => rand(1000),
    :inactive       => false,
    :description    => "Descricao numero #{n}"
  )
end

(1..10).each do |n|
  Provider.create!(
    :name               => "Prestador n-#{n}",
    :cpf                => "#{rand(10)}",
    :rg                 => "#{rand(10)}horas",
    :observations       => rand(1000),
    :active             => true,
    :address_attributes => {
      :address      => "Rua #{n}",
      :number       => rand(100),
      :complement   => "casa",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade #{n}",
      :neighborhood => "Bairro #{n}"
    }
  )
end


(1..10).each do |n|
  Client.create!(
    :name               => "Cliente n-#{n}",
    :cpf                => "#{rand(100_000_000)}",
    :rg                 => "#{rand(100_000_000)}",
    :observations       => "Observacao #{n}",
    :address_attributes => {
      :address      => "Rua #{n}",
      :number       => rand(1000),
      :complement   => "casa",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade #{n}",
      :neighborhood => "Bairro #{n}"
    }
  )
end
