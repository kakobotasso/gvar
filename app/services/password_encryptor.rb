class PasswordEncryptor
  # Retorna o hash e o salt da senha que sera salvo com o usuario
  #
  #   PasswordEncryptor.encrypt("test")
  #   #=> {:hash => "abc...", :salt => "salt123"}
  #
  def self.encrypt(password)
    salt = encryptor.hexdigest(rand.to_s)
    hash = hasher(password, salt)

    {:salt => salt, :hash => hash}
  end

  # Senha sera um texto.
  # Salt sera um texto aleatorio.
  #
  #   PasswordEncryptor.hasher("test", "salt123")
  #   #=>
  #
  def self.hasher(password, salt)
    encryptor.hexdigest("--#{salt}--#{password}--")
  end

  # Retorna o adapter do encriptador. Precisa apenas responder 
  # ao metodo +hexdigest+
  #
  def self.encryptor
    Digest::SHA1
  end
end
