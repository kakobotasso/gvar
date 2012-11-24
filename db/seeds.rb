# *-* encoding: utf-8 *-*
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
[
  "Massagem com pedras",
  "Terapia para idosos",
  "Workshop sobre Alzheimer",
  "Treinamento de primeiros socorros"
].each do |n|
  Service.create!(
    :name           => "Service n-#{n}",
    :number_days    => rand(10),
    :estimated_time => "#{rand(10)}horas",
    :default_value  => rand(1000),
    :inactive       => false,
    :description    => "Descricao numero #{n}"
  )
end

[
  "Lucas Cardoso",
  "Mateus Galvão",
  "Pedro Morae",
  "Guilherme Rspec",
  "Gustavo Java"
].each do |n|
  Provider.create!(
    :name               => n,
    :cpf                => "#{rand(10)}",
    :rg                 => "#{rand(10)}",
    :observations       => "Observações para #{n}",
    :active             => true,
    :address_attributes => {
      :address      => "Rua Aindatestando",
      :number       => rand(100),
      :complement   => "casa #{rand(10)}",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade do #{n}",
      :neighborhood => "Bairro do #{n}"
    }
  )
end


[
  "Miguel Sampaio",
  "Davi Souza",
  "Gabriel Alves",
  "Arthur Pablo",
  "Rafael Silva"
].each do |n|
  Client.create!(
    :name               => n,
    :cpf                => "#{rand(100_000_000)}",
    :rg                 => "#{rand(100_000_000)}",
    :observations       => "Observacao para #{n}",
    :address_attributes => {
      :address      => "Rua Paratestar",
      :number       => rand(1000),
      :complement   => "casa #{rand(10)}",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade do #{n}",
      :neighborhood => "Bairro do #{n}"
    }
  )
end

[
  "Informatica Para Idosos",
  "Cuidadores Modulo I",
  "Cuidadores Modulo II",
  "Massagem Terapeutica",
  "Primeiros Socorros"
].each do |n|
  Course.create!(
    :code        => "C12112406#{rand(1000)}",
    :name        => n,
    :course_type => rand(3),
    :description => "Descrição para o curso de #{n}",
    :active      => true
  )
end

[
  "Dezembro Ter/Qui - Manhã",
  "Dezembro Sabado - 8 horas",
  "Dezembro Ter/Qui - Tarde",
  "Dezembro Seg/Qua/Sex - Noite",
  "Janeiro Sabado - 8 horas",
  "Janeiro Ter/Qui - Tarde",
  "Nobembro Seg/Qua/Sex - Noite",
].each do |n|
  Team.create!(
    :code        => "T12112406#{rand(1000)}",
    :name        => n,
    :course_id => rand(5)+1,
    :season => rand(3),
    :limit => rand(20),
    :price => rand(5)*50,
    :class_length => rand(20),
    :workload => "rand(8) horas",
    :status => 0,
    :note => "Observações para a turma de #{n}"
  )
end
