class ChangePasswordMailer < ActionMailer::Base
  default from: "piruk7@gmail.com"
  
  def new_password_mail(user,password)
    @usuario = user.name
    @senha   = password

    mail(:to => user.email, :subject => "Nova senha para acesso ao GVAR")
  end
end
