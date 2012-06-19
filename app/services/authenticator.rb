class Authenticator
  def self.authenticate(login, password)
    user = User.find_by_login(login)

    return unless user

    actual_hash = PasswordEncryptor.hasher(password, user.password_salt)

    return user if user.password_hash == actual_hash
  end
end
