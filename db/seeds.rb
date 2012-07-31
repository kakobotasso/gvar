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
