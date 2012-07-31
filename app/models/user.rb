class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :login, :role_ids
  has_and_belongs_to_many :roles
  attr_reader :password

  validates_presence_of :name, :login
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :login

  # mara = User.find_by_login("mara");
  # mara.have_role? :admin     #true
  # mara.have_role? :pagamento #false
  #
  def have_role? role
    self.roles ||= []
    my_holes = self.roles.collect {|r| r.name.to_s }
    my_holes.include? role.to_s
  end

  # mara = User.find_by_login("mara");
  # mara.servico?   #true
  # mara.pagamento? #false
  #
  # admin? pagamento? recebimento? curso? servico? acessoria?
  # def admin?
  #   _role = []
  #   self.roles ||= []
  #   self.roles.each do |role|
  #     _role << role.name
  #   end
  #   _role.include? "admin"
  # end

  def password=(password)
    encryption = PasswordEncryptor.encrypt(password)

    self.password_salt = encryption[:salt]
    self.password_hash = encryption[:hash]

    @password = password
  end
end
