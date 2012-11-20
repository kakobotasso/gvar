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
