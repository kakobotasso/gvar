class User < ActiveRecord::Base
  attr_accessible :email, :login, :name, :password_hash, :password_salt
end
