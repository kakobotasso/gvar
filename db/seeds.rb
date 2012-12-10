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
(1..20).each do |n|
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
  "Treinamento de primeiros socorros",
  "Palestras sobre cuidados com idosos"
].each do |o|
  Service.create!(
    :name           => o,
    :number_days    => rand(10),
    :estimated_time => "#{rand(10)}horas",
    :default_value  => rand(1000),
    :inactive       => false,
    :description    => "Descricao numero #{o}"
  )
end

[
  "Lucas Cardoso",
  "Mateus Galvão",
  "Pedro Morae",
  "Guilherme Rspec",
  "Gustavo Java",
  "John Doe"
].each do |p|
  Provider.create!(
    :name               => p,
    :cpf                => "#{rand(10)}",
    :rg                 => "#{rand(10)}",
    :observations       => "Observações para #{p}",
    :active             => true,
    :address_attributes => {
      :address      => "Rua Aindatestando",
      :number       => rand(100),
      :complement   => "casa #{rand(10)}",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade do #{p}",
      :neighborhood => "Bairro do #{p}"
    }
  )
end


[
  "Miguel Sampaio",
  "Davi Souza",
  "Gabriel Alves",
  "Arthur Pablo",
  "Rafael Silva",
  "Kako Test"
].each do |c|
  Client.create!(
    :name               => c,
    :cpf                => "#{rand(100_000_000)}",
    :rg                 => "#{rand(100_000_000)}",
    :observations       => "Observacao para #{c}",
    :address_attributes => {
      :address      => "Rua Paratestar",
      :number       => rand(1000),
      :complement   => "casa #{rand(10)}",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade do #{c}",
      :neighborhood => "Bairro do #{c}"
    }
  )
end

[
  "Pamella Milks",
  "Mayra Kreisy",
  "Uker Roderick",
  "Vanci Ibrahin",
  "Isis Simoni",
  "Mary Faliti"
].each do |s|
  Student.create!(
    :name         => s,
    :cpf          => "#{rand(100_000_000)}",
    :rg           => "#{rand(100_000_000)}",
    :observations => "Observacao para #{s}",
    :sex          => 0,
    :birth_date   => "21/08/1985",
    :occupation   => "Dev",
    :relationship_elderly => 0,
    :schooling    => "Analfabeto",
    :address_attributes => {
      :address      => "Rua Paratestar",
      :number       => rand(1000),
      :complement   => "casa #{rand(10)}",
      :zipcode      => rand(100_000_000),
      :country_id   => rand(20),
      :city         => "Cidade do #{s}",
      :neighborhood => "Bairro do #{s}"
    }
  )
end

[
  "Informatica Para Idosos",
  "Cuidadores Modulo I",
  "Cuidadores Modulo II",
  "Massagem Terapeutica",
  "Primeiros Socorros"
].each do |u|
  Course.create!(
    :code        => "C12112406#{rand(1000)}",
    :name        => u,
    :course_type => rand(3),
    :description => "Descrição para o curso de #{u}",
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
  "Novembro Seg/Qua/Sex - Noite",
].each do |v|
  Team.create!(
    :code        => "T12112406#{rand(1000)}",
    :name        => v,
    :course_id => rand(5)+1,
    :season => rand(3),
    :limit => rand(20),
    :price => rand(5)*50,
    :class_length => rand(20),
    :workload => "#{rand(8)} horas",
    :status => 0,
    :note => "Observações para a turma de #{v}"
  )
end

(1..5).each do |z|
  Schedule.create!(
    :code => "S12120114390#{z}",
    :service_id => z,
    :provider_id => z,
    :client_id => (z),
    :estimated_time => "#{z}horas",
    :number_days => z,
    :date => Date.today,
    :observations => "qualquer observacao - #{z}"
  )
end
