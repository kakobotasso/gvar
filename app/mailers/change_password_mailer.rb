class ChangePasswordMailer < ActionMailer::Base
  default from: "armando@testandocodigo.com.br"

  def new_password_mail(options)
    @usuario = options[:name]
    @url     = "http://192.34.58.203"
    @url_password = "http://www.testandocodigo.com.br/cadastrar-senha"
    @url_password << "?email="
    @url_password << options[:email]
    @url_password << "&ps="
    @url_password << options[:password_salt]

    @subject = options[:subject] || "Nova senha para acesso ao GVAR"

    mail(:to => options[:email], :subject => @subject)
  end
end
